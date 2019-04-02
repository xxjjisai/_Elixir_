_G.EnemyGridWalkSystem = System:DeriveClass("EnemyGridWalkSystem");

EnemyGridWalkSystem:SetRegisterCompo{

};

function EnemyGridWalkSystem:Start()
    Event:AddEvent(GridWalkSystem,self);
end

function EnemyGridWalkSystem:EvtPlayerMoveComplete()
    local iScene = self:GetCurScene();
	for _,tbLayer in pairs(iScene:GetRenderList()) do
		for _,iActor in ipairs(tbLayer) do 
			repeat
				if not self:GetRegisterCompo(iActor) then break end
                if not iActor.bVisible then break end
                if iActor.sTagType ~= "Enemy" then 
                    break;
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
                if not bCanWalk then self.bMoved = false return end
                local tbStartPoint = self:GetNodeFromRealMap(nPCol,nPRow,tbRealMapInfo);
                local tbEndPoint = self:GetNodeFromRealMap(nMCol,nMRow,tbRealMapInfo);
                if tbStartPoint == nil or tbEndPoint == nil then 
                    self:Trace(2," Not Find Start or End Point ");
                    return 
                end  
                FindPathSystem:SearchPath(tbStartPoint,tbEndPoint,function (nCode,tbPath)
                    if nCode ~= 0 then 
                        self:Trace(1,"Find Path Fail!");
                        return;
                    end 
                    EnemyTweenMoveSystem:SearchPathComplete(iActor,tbPath,function ()
                        
                    end);
                end)
			until true
		end
	end 

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