_G.EnemyTweenMoveSystem = System:DeriveClass("EnemyTweenMoveSystem");

EnemyTweenMoveSystem.tbDataPlayer = {x = 0,y = 0};
EnemyTweenMoveSystem.tbPath = nil;
EnemyTweenMoveSystem:SetRegisterCompo{

};
function EnemyTweenMoveSystem:SearchPathComplete(iActor,tbPath,pfn)
    self.iActor = iActor;
    self.tbPath = tbPath;
    self.pfn = pfn; 
    self.tbDataPlayer = 
    {
        x = self.iActor:GetiCompo("Transform").x,
        y = self.iActor:GetiCompo("Transform").y
    };
    table.remove(self.tbPath,#self.tbPath);
    self:MoveHandler(self:GetNextNode());
end

function EnemyTweenMoveSystem:MoveHandler(iTargetNode)
    if iTargetNode == nil then 
        if self.pfn then 
            self.pfn();
            return;
        end 
        return;
    end 
    local pw = self.iActor:GetiCompo("Transform").w;
    local ph = self.iActor:GetiCompo("Transform").h;
    local nx,ny = iTargetNode.x,iTargetNode.y;
    local nCellSize = iTargetNode.nCellSize;
    local nNCol,nNRow = math.floor(nx/nCellSize),math.floor(ny/nCellSize);
    local ox,oy = nNCol * nCellSize,nNRow * nCellSize ;
    local tbPos = { x = ox, y = oy }
    Tween(0.4,self.iActor:GetiCompo("Transform"),{ x = ox,y = oy },'outQuad',function ()
        self:MoveHandler(self:GetNextNode());
    end)
end 

function EnemyTweenMoveSystem:GetNextNode()
    local nNextNode = self.tbPath[#self.tbPath];
    table.remove(self.tbPath,#self.tbPath);
    return nNextNode;
end