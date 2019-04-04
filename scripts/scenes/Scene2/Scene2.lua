_G.Scene2 = GameChainSystem:DeriveClass('Scene2');

function Scene2:StartHandler()
    local iScene = self:GetCurScene();
    local iMap = iScene:GetActorByTagType("Map");
    local iMapCompo = iMap:GetiCompo("Map");

    -- for i = 1,2 do 
    --     local iEnemy = ActorMgr:GetActor("Enemy"..i)
    --     local tbBorn = iMapCompo.tbRealMapInfo[math.random(1, #iMapCompo.tbRealMapInfo)]; 
    --     tbBorn.nWalkAble = 0;
    --     iEnemy:ChangeiCompoParam({
    --         ["Transform"] = { x = tbBorn.x, y = tbBorn.y};
    --     });
    -- end

end

function Scene2:DestoryHandler()

end