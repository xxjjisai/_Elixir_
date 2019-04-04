_G.MapGeneratorSystem = System:DeriveClass("MapGeneratorSystem");

MapGeneratorSystem:SetRegisterCompo{
    "Map","AStar"
};

function MapGeneratorSystem:GeneratorHandler(pfn)
    local iScene = self:GetCurScene();
    local iMap = iScene:GetActorByTagType("Map");
    if not self:GetRegisterCompo(iMap) then return end
    local iMapCompo = iMap:GetiCompo("Map");
    local iAstarCompo = iMap:GetiCompo("AStar");
    local tbMapInfo = {};
    math.randomseed(os.time());
    self.nCount = 0;
    iAstarCompo.tbNode.nCellSize = iMapCompo.nCellSize;
    iMapCompo.tbDataMapInfo = {iAstarCompo.tbNode};
    iMapCompo.tbRealMapInfo = {iAstarCompo.tbNode};
    while self.nCount < iMapCompo.nCellCount do
        local tbNode = clone( iMapCompo.tbDataMapInfo[#iMapCompo.tbDataMapInfo] );
        local nDir = math.random(1,4);
        if nDir == 1 then 
            tbNode.x = tbNode.x + iMapCompo.nCellSize;
        elseif nDir == 2 then  
            tbNode.x = tbNode.x - iMapCompo.nCellSize;
        elseif nDir == 3 then  
            tbNode.y = tbNode.y + iMapCompo.nCellSize;
        elseif nDir == 4 then  
            tbNode.y = tbNode.y - iMapCompo.nCellSize;
        end
        tbNode.nWalkAble = 1;
        tbNode.nCellSize = iMapCompo.nCellSize;
        local nTCol,nTRow = math.floor(tbNode.x/iMapCompo.nCellSize),math.floor(tbNode.y/iMapCompo.nCellSize);
        tbNode.nCol = nTCol;
        tbNode.nRow = nTRow;
        if not self:GetSameItem(iMapCompo.tbDataMapInfo,tbNode) then 
            table.insert(iMapCompo.tbRealMapInfo,tbNode);
        end
        table.insert(iMapCompo.tbDataMapInfo,tbNode);
        self.nCount = self.nCount + 1;
    end 

    if pfn then 
        pfn()  
    end
end

function MapGeneratorSystem:GetSameItem(tbDataMapInfo,tbNode)
    for i = 1,#tbDataMapInfo do 
        local item = tbDataMapInfo[i];
        if item.x == tbNode.x and item.y == tbNode.y then 
            return true;
        end 
    end
    return false;
end

function MapGeneratorSystem:QuerytbNodeByColAndRow(iMapCompo,nCol,nRow)
    for i = 1, #iMapCompo.tbRealMapInfo do
        local tbNode = iMapCompo.tbRealMapInfo[i];
        if tbNode.nCol == nCol and tbNode.nRow == nRow then 
            return tbNode
        end 
    end
end

function MapGeneratorSystem:GetRandomNode(iMapCompo,nType)
    for i = 1, #iMapCompo.tbRealMapInfo do
        local tbNode = iMapCompo.tbRealMapInfo[i];
        if tbNode.nWalkAble == nType then 
            return tbNode
        end
    end
end

function MapGeneratorSystem:CreateTile(iMapCompo)
    local iScene = self:GetCurScene();
    for i = 1, #iMapCompo.tbRealMapInfo do
        local tbNode = iMapCompo.tbRealMapInfo[i];
        local iTile = ActorMgr:CreateActor("Tile");
        iScene:AddActor(iTile);
        iTile:ChangeiCompoParam({
            ["Transform"] = { x = tbNode.x, y = tbNode.y };
        });
        tbNode.nWalkAble = 1;
        tbNode.nID = Origin:SetUniqueID();
        tbNode.addNeighbors(tbNode,iMapCompo.tbRealMapInfo);
    end
end

function MapGeneratorSystem:CreateEdge(iMapCompo)
    local iScene = self:GetCurScene();
    for i = 1, #iMapCompo.tbRealMapInfo do
        local tbNode = iMapCompo.tbRealMapInfo[i];
        local nDownTileX = tbNode.x;
        local nDownTileY = tbNode.y + iMapCompo.nCellSize;
        local nTCol,nTRow = math.floor(nDownTileX/iMapCompo.nCellSize),math.floor(nDownTileY/iMapCompo.nCellSize);
        local iDownNode = self:QuerytbNodeByColAndRow(iMapCompo,nTCol,nTRow)
        if not iDownNode then 
            local iEdge = ActorMgr:CreateActor("Edge");
            iScene:AddActor(iEdge);
            iEdge:ChangeiCompoParam({
                ["Transform"] = { x = nDownTileX, y = nDownTileY };
            });
        end 
    end
end 


