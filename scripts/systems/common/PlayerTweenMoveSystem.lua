_G.PlayerTweenMoveSystem = System:DeriveClass("PlayerTweenMoveSystem");

PlayerTweenMoveSystem.tbDataPlayer = {x = 0,y = 0};
PlayerTweenMoveSystem.tbPath = nil;
PlayerTweenMoveSystem:SetRegisterCompo{
    "GridWalk"
};

function PlayerTweenMoveSystem:Start()
    local iPlayer = SceneMgr:GetCurPlayer();
    self.tbDataPlayer = 
    {
        x = iPlayer:GetiCompo("Transform").x,
        y = iPlayer:GetiCompo("Transform").y
    };
end

function PlayerTweenMoveSystem:SearchPathComplete(tbPath,pfn)
    self.tbPath = tbPath;
    self.pfn = pfn;
    local iScene = self:GetCurScene();
    table.remove(self.tbPath,#self.tbPath);
    self:MoveHandler(self:GetNextNode());
end

function PlayerTweenMoveSystem:MoveHandler(iTargetNode)
    if iTargetNode == nil then 
        if self.pfn then 
            self.pfn();
            return;
        end 
        return;
    end 
    local iPlayer = SceneMgr:GetCurPlayer();
    local pw = iPlayer:GetiCompo("Transform").w;
    local ph = iPlayer:GetiCompo("Transform").h;
    local nx,ny = iTargetNode.x,iTargetNode.y;
    local nCellSize = iTargetNode.nCellSize;
    local nNCol,nNRow = math.floor(nx/nCellSize),math.floor(ny/nCellSize);
    local ox,oy = nNCol * nCellSize,nNRow * nCellSize ;
    local tbPos = { x = ox, y = oy }
    Tween(0.4,iPlayer:GetiCompo("Transform"),{ x = ox,y = oy },'outQuad',function ()
        self:MoveHandler(self:GetNextNode());
    end)
end 

function PlayerTweenMoveSystem:GetNextNode()
    local nNextNode = self.tbPath[#self.tbPath];
    table.remove(self.tbPath,#self.tbPath);
    return nNextNode;
end