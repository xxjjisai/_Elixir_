_G.EnemyGridWalkSystem = System:DeriveClass("EnemyGridWalkSystem");

EnemyGridWalkSystem:SetRegisterCompo{
    
};

function EnemyGridWalkSystem:Start()
    Event:AddEvent(GridWalkSystem,self);
end

function EnemyGridWalkSystem:EvtPlayerMoveComplete(pfn)
    local iScene = self:GetCurScene();
    local iPlayer = SceneMgr:GetCurPlayer();
    local tbActorHate = iPlayer:GetiCompo("HateList").tbActorHate;
    self.nIndex = 1;
    self.tbActorHate = {};
    if #tbActorHate <= 0 then 
        if pfn then 
            pfn()
        end 
        return 
    end
    for i = 1,#tbActorHate do 
        local iActor = tbActorHate[i];
        if iActor.sTagType == "Enemy" then 
            ColorSystem:ChangeColor(iActor,"R");
            table.insert(self.tbActorHate, iActor);
        end
    end
    if #self.tbActorHate <= 0 then 
        if pfn then 
            pfn()
        end 
        return 
    end
    self:MoveEnemyHandler(pfn); 
end

function EnemyGridWalkSystem:MoveEnemyHandler(pfn) 
    local iScene = self:GetCurScene();
    local tbActorList = self.tbActorHate;
    local iActor = tbActorList[self.nIndex];
    if iActor == nil then 
        if pfn then 
            pfn()
        end 
        self:Trace(2, "iActor is nil !")
        return 
    end 
    local iMap = iScene:GetActorByTagType("Map");
    local iMapCompo = iMap:GetiCompo("Map");
    local nCellSize = iMapCompo.nCellSize;
    local tbRealMapInfo = iMapCompo.tbRealMapInfo
    local px = iActor:GetiCompo("Transform").x;
    local py = iActor:GetiCompo("Transform").y;
    local nPCol,nPRow = math.floor(px/nCellSize),math.floor(py/nCellSize);
    local tbNode = tbRealMapInfo[math.random(1, #tbRealMapInfo)];
    local mx,my = tbNode.x,tbNode.y;
    local nMCol,nMRow = math.floor(mx/nCellSize),math.floor(my/nCellSize);
    local bCanWalk = self:CheckCanWalk(nMCol,nMRow,tbRealMapInfo);
    if not bCanWalk then 
        self:Trace(2," Can't walk ");
        ColorSystem:ChangeColor(iActor,"White")
        self.nIndex = self.nIndex + 1;
        if self.nIndex > #tbActorList then 
            if pfn then 
                pfn()
            end 
            return;
        end
        self:MoveEnemyHandler(pfn);
        return 
    end
    local tbStartPoint = self:GetNodeFromRealMap(nPCol,nPRow,tbRealMapInfo);
    tbStartPoint.nWalkAble = 1;
    local tbEndPoint = self:GetNodeFromRealMap(nMCol,nMRow,tbRealMapInfo);
    if tbStartPoint == nil or tbEndPoint == nil then 
        self:Trace(2," Not Find Start or End Point ");
        tbStartPoint.nWalkAble = 0;
        ColorSystem:ChangeColor(iActor,"White")
        self.nIndex = self.nIndex + 1;
        if self.nIndex > #tbActorList then 
            if pfn then 
                pfn()
            end 
            return;
        end
        self:MoveEnemyHandler(pfn);
        return 
    end  
    FindPathSystem:SearchPath(tbStartPoint,tbEndPoint,function (nCode,tbPath)
        if nCode ~= 0 then 
            tbStartPoint.nWalkAble = 0;
            ColorSystem:ChangeColor(iActor,"White")
            self:Trace(1,"Find Path Fail!");
            self.nIndex = self.nIndex + 1;
            if self.nIndex > #tbActorList then 
                if pfn then 
                    pfn()
                end 
                return;
            end
            self:MoveEnemyHandler(pfn);
            return;
        end 
        EnemyTweenMoveSystem:SearchPathComplete(iActor,tbPath,function ()
            if self.nIndex > #tbActorList then 
                if pfn then 
                    pfn()
                end 
                return;
            end 
            ColorSystem:ChangeColor(iActor,"White")
            tbEndPoint.nWalkAble = 0;
            self.nIndex = self.nIndex + 1;
            self:MoveEnemyHandler(pfn);
        end);
    end)
end 

function EnemyGridWalkSystem:CheckCanWalk(nCol,nRow,tbRealMapInfo)
    for i,tbNode in ipairs(tbRealMapInfo) do 
        if nCol == tbNode.nCol and nRow == tbNode.nRow then 
            if tbNode.nWalkAble == 1 then 
                return true 
            end 
        end
    end
    return false;
end

function EnemyGridWalkSystem:GetNodeFromRealMap(nCol,nRow,tbRealMapInfo)
    for i,tbNode in ipairs(tbRealMapInfo) do 
        if nCol == tbNode.nCol and nRow == tbNode.nRow then 
            return tbNode;
        end
    end
    return nil;
end