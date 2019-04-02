_G.Scene1 = GameChainSystem:DeriveClass('Scene1');

function Scene1:StartHandler()

    local iScene = self:GetCurScene();
    local iMap = iScene:GetActorByTagType("Map");
    local iMapCompo = iMap:GetiCompo("Map");

    local iEnemy1 = ActorMgr:GetActor("Enemy1")
    local nPw = iEnemy1:GetiCompo("Transform").w;
    local nPh = iEnemy1:GetiCompo("Transform").h;
    local tbBorn = iMapCompo.tbRealMapInfo[math.random(1, #iMapCompo.tbRealMapInfo)]; 
    iEnemy1:ChangeiCompoParam({
        ["Transform"] = { x = tbBorn.x, y = tbBorn.y};
    });

    local iEnemy2 = ActorMgr:GetActor("Enemy2")
    local nPw = iEnemy2:GetiCompo("Transform").w;
    local nPh = iEnemy2:GetiCompo("Transform").h;
    local tbBorn = iMapCompo.tbRealMapInfo[math.random(1, #iMapCompo.tbRealMapInfo)]; 
    iEnemy2:ChangeiCompoParam({
        ["Transform"] = { x = tbBorn.x, y = tbBorn.y};
    });

    -- local iEnemy3 = ActorMgr:GetActor("Enemy3")
    -- local nPw = iEnemy3:GetiCompo("Transform").w;
    -- local nPh = iEnemy3:GetiCompo("Transform").h;
    -- local tbBorn = iMapCompo.tbRealMapInfo[math.random(1, #iMapCompo.tbRealMapInfo)]; 
    -- iEnemy3:ChangeiCompoParam({
    --     ["Transform"] = { x = tbBorn.x, y = tbBorn.y};
    -- });

    -- local iEnemy4 = ActorMgr:GetActor("Enemy4")
    -- local nPw = iEnemy4:GetiCompo("Transform").w;
    -- local nPh = iEnemy4:GetiCompo("Transform").h;
    -- local tbBorn = iMapCompo.tbRealMapInfo[math.random(1, #iMapCompo.tbRealMapInfo)]; 
    -- iEnemy4:ChangeiCompoParam({
    --     ["Transform"] = { x = tbBorn.x, y = tbBorn.y};
    -- });
end

function Scene1:Update(dt)

end

function Scene1:Render()

end

function Scene1:DestoryHandler()

end