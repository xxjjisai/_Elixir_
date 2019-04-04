_G.Scene1 = GameChainSystem:DeriveClass('Scene1');

function Scene1:StartHandler()
    local iScene = self:GetCurScene();
    local iMap = iScene:GetActorByTagType("Map");
    local iMapCompo = iMap:GetiCompo("Map");

    for i = 1,7 do 
        local iEnemy = ActorMgr:GetActor("Enemy"..i);
        local tbBorn = iMapCompo.tbRealMapInfo[math.random(1, #iMapCompo.tbRealMapInfo)];
        tbBorn.nWalkAble = 0;
        ActorMgr:ResetActorPosition(iEnemy,tbBorn.x,tbBorn.y);
    end

end

function Scene1:DestoryHandler()

end