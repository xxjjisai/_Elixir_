_G.GridWalkSystem = System:DeriveClass("GridWalkSystem");

GridWalkSystem.bMoved = false;
GridWalkSystem.tbEndPoint = nil;


GridWalkSystem:SetRegisterCompo{

};

function GridWalkSystem:Start()
    self.bMoved = false;  
    self.tbEndPoint = nil;
end

function GridWalkSystem:Render()
    local iScene = self:GetCurScene();
    local iPlayer = SceneMgr:GetCurPlayer();
    local nSightRange = iPlayer:GetiCompo("SightRange").nSightRange;
    local px = iPlayer:GetiCompo("Transform").x;
    local py = iPlayer:GetiCompo("Transform").y;
    local pw = iPlayer:GetiCompo("Transform").w;
    local ph = iPlayer:GetiCompo("Transform").h;
    if Option.bDebug then 
        love.graphics.setColor(1,1,1,1);
        love.graphics.setLineWidth(1);
        love.graphics.circle("line",px + pw * 0.5,py + ph * 0.5,nSightRange,100);
    end

    local iMap = iScene:GetActorByTagType("Map");
    if iMap == nil then return end 
    local iMapCompo = iMap:GetiCompo("Map");
    local nCellSize = iMapCompo.nCellSize;
    local tbRealMapInfo = iMapCompo.tbRealMapInfo;
    if Option.bDebug then 
        love.graphics.setColor(1,1,1,1);
        love.graphics.setLineWidth(1);
        for i,tbNode in ipairs(tbRealMapInfo) do 
            if tbNode.nWalkAble == 0 then 
                love.graphics.rectangle("line",tbNode.x,tbNode.y,nCellSize,nCellSize)
            end 
        end 
    end
    if self.bMoved then return end 
    local mx,my = CameraMgr:GetMousePosition();
    local nCol,nRow = math.floor(mx/nCellSize),math.floor(my/nCellSize);
    local ox,oy = nCol * nCellSize,nRow * nCellSize;
    if ox == nil or oy == nil then return end;
    local bCanWalk = self:CheckCanWalk(nCol,nRow,tbRealMapInfo);
    if not bCanWalk then return end
    love.graphics.setColor(1,0.4,0.4,1);
    love.graphics.setLineStyle("smooth")
    love.graphics.setLineWidth(4)
    love.graphics.rectangle("line",ox,oy,nCellSize,nCellSize);
    love.graphics.setColor(1,1,1,1);
    love.graphics.setLineWidth(1); 
end

function GridWalkSystem:MouseDown(x,y,button)
    if button == 1 then 
        if self.bMoved then return end 
        self.bMoved = true;
        self.tbEndPoint = nil;
        local iScene = self:GetCurScene();
        local iPlayer = SceneMgr:GetCurPlayer();
        local iMap = iScene:GetActorByTagType("Map");
        if iMap == nil then self.bMoved = false return end 
        local iMapCompo = iMap:GetiCompo("Map");
        local nCellSize = iMapCompo.nCellSize;
        local tbRealMapInfo = iMapCompo.tbRealMapInfo;
        local px = iPlayer:GetiCompo("Transform").x;
        local py = iPlayer:GetiCompo("Transform").y;
        local nPCol,nPRow = math.floor(px/nCellSize),math.floor(py/nCellSize);
        local mx,my = CameraMgr:GetMousePosition();
        local nMCol,nMRow = math.floor(mx/nCellSize),math.floor(my/nCellSize);
        local bCanWalk = self:CheckCanWalk(nMCol,nMRow,tbRealMapInfo);
        if not bCanWalk then self.bMoved = false return end
        self.tbDataPlayer = {x = px, y = py};
        local tbStartPoint = self:GetNodeFromRealMap(nPCol,nPRow,tbRealMapInfo);
        tbStartPoint.nWalkAble = 1;
        local tbEndPoint = self:GetNodeFromRealMap(nMCol,nMRow,tbRealMapInfo);
        if tbStartPoint == nil or tbEndPoint == nil then 
            self:Trace(2," Not Find Start or End Point ");
            self.bMoved = false
            return 
        end 
        self.tbEndPoint = tbEndPoint;
        FindPathSystem:SearchPath(tbStartPoint,tbEndPoint,function (nCode,tbPath)
            if nCode ~= 0 then 
                self:Trace(1,"Find Path Fail!");
                self.bMoved = false;
                return;
            end 
            PlayerTweenMoveSystem:SearchPathComplete(tbPath,function ()
                tbEndPoint.nWalkAble = 0;
                -- 运动停止后对视野范围内的Actor进行筛选
                local nSightRange = iPlayer:GetiCompo("SightRange").nSightRange;
                iPlayer:GetiCompo("HateList").tbActorHate = {};
                local nEndPx = iPlayer:GetiCompo("Transform").x + iPlayer:GetiCompo("Transform").w * 0.5;
                local nEndPy = iPlayer:GetiCompo("Transform").y + iPlayer:GetiCompo("Transform").h * 0.5;
                local tbActorList = iScene:GetActorList();
                for i = 1, #tbActorList do 
                    local iActor = tbActorList[i];
                    if iActor then 
                        local nEndAx = iActor:GetiCompo("Transform").x + iActor:GetiCompo("Transform").w * 0.5;
                        local nEndAy = iActor:GetiCompo("Transform").y + iActor:GetiCompo("Transform").h * 0.5;
                        local nDist = Dist(nEndPx,nEndPy,nEndAx,nEndAy);
                        if nDist <= nSightRange then 
                            table.insert(iPlayer:GetiCompo("HateList").tbActorHate, iActor)
                        end
                    end
                end

                Event:DoEvent(self,"EvtPlayerMoveComplete");

                self:MoveOtherActor(function ()
                    self.bMoved = false;
                end)

            end);
        end)
    end
end

function GridWalkSystem:CheckCanWalk(nCol,nRow,tbRealMapInfo)
    for i,tbNode in ipairs(tbRealMapInfo) do 
        if nCol == tbNode.nCol and nRow == tbNode.nRow then 
            if tbNode.nWalkAble == 1 then 
                return true 
            end 
        end
    end
    return false;
end

function GridWalkSystem:GetNodeFromRealMap(nCol,nRow,tbRealMapInfo)
    for i,tbNode in ipairs(tbRealMapInfo) do 
        if nCol == tbNode.nCol and nRow == tbNode.nRow then 
            return tbNode;
        end
    end
    return nil;
end

function GridWalkSystem:MoveOtherActor(pfn)
    local iScene = self:GetCurScene();
    local iPlayer = SceneMgr:GetCurPlayer();
    local tbActorHate = iPlayer:GetiCompo("HateList").tbActorHate;
    local tbActionActor = iScene:GetActionActor();
    local iMap = iScene:GetActorByTagType("Map");
    local iMapCompo = iMap:GetiCompo("Map");
    local nCellSize = iMapCompo.nCellSize;
    local tbRealMapInfo = iMapCompo.tbRealMapInfo;
    local nIndex = 1;
    local tbMoveActor = {};
    for i,v in ipairs(tbActorHate) do 
        if self:FindActionActor(tbActionActor,v.sTagType) then
            table.insert(tbMoveActor,v);
        end
    end 
    local function StartHandler(iActor)
        nIndex = nIndex + 1;
        if nIndex >= #tbMoveActor then 
            if pfn then
                pfn();
            end
            return
        end 
        local px = iActor:GetiCompo("Transform").x;
        local py = iActor:GetiCompo("Transform").y;
        local nPCol,nPRow = math.floor(px/nCellSize),math.floor(py/nCellSize);
        local tbNode = self:GetNewNodeForActorMove(tbRealMapInfo);--tbRealMapInfo[math.random(1, #tbRealMapInfo)];
        local mx,my = tbNode.x,tbNode.y;
        local nMCol,nMRow = math.floor(mx/nCellSize),math.floor(my/nCellSize);
        local bCanWalk = self:CheckCanWalk(nMCol,nMRow,tbRealMapInfo);
        if not bCanWalk then
            local iActorNext = tbMoveActor[nIndex];
            StartHandler(iActorNext)
            return
        end
        local tbStartPoint = self:GetNodeFromRealMap(nPCol,nPRow,tbRealMapInfo);
        tbStartPoint.nWalkAble = 1;
        local tbEndPoint = self:GetNodeFromRealMap(nMCol,nMRow,tbRealMapInfo);
        if tbStartPoint == nil or tbEndPoint == nil then
            self:Trace(2," Not Find Start or End Point ");
            tbStartPoint.nWalkAble = 0;
            ColorSystem:ChangeColor(iActor,"White")
            local iActorNext = tbMoveActor[nIndex];
            StartHandler(iActorNext)
            return
        end  
        FindPathSystem:SearchPath(tbStartPoint,tbEndPoint,function (nCode,tbPath)
            if nCode ~= 0 then
                tbStartPoint.nWalkAble = 0;
                ColorSystem:ChangeColor(iActor,"White")
                self:Trace(1,"Find Path Fail!");
                local iActorNext = tbMoveActor[nIndex];
                StartHandler(iActorNext)
                return
            end
            EnemyTweenMoveSystem:SearchPathComplete(iActor,tbPath,function ()
                ColorSystem:ChangeColor(iActor,"White")
                tbEndPoint.nWalkAble = 0;
                local iActorNext = tbMoveActor[nIndex];
                StartHandler(iActorNext)
                return
            end);
        end)
    end

    local iActor = tbMoveActor[nIndex];
    StartHandler(iActor)
end

function GridWalkSystem:FindActionActor(tbActionActor,sType)
    for i,sActorType in ipairs(tbActionActor) do 
        if sActorType == sType then
            return sActorType
        end
    end
    return nil
end

function GridWalkSystem:GetNewNodeForActorMove(tbRealMapInfo)
    for i = 1, #iMapCompo.tbRealMapInfo do
        local tbNode = iMapCompo.tbRealMapInfo[i];
        
    end
end
