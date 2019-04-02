
_G.ContentMgr = Class:DeriveClass("ContentMgr");

function ContentMgr:ProduceHandler(iScene,fCallback)
    local cfg = _G["Scene_"..iScene.nSceneID];
    for _,tbActor in ipairs(cfg.tbActor) do 
        local iActor = ActorMgr:CreateActor(tbActor.sActorType,tbActor.sUseName,tbActor.tbProperty);
        iScene:AddActor(iActor);
    end 
    if cfg.tbUI then 
        for _,tbUI in ipairs(cfg.tbUI) do 
            local iUI = UIMgr:CreateUI(tbUI.sUIType,tbUI.sUseName,tbUI.tbProperty);
        end 
    end
    for _,sSystemName in ipairs(cfg.tbSystem) do 
        iScene:RegisterSystem(_G[sSystemName]);
    end 
    if cfg.tbMap then 
        local iMap = iScene:GetActorByTagType("Map");
        if iMap then 
            local iMapCompo = iMap:GetiCompo("Map");
            iMapCompo.nCellCount = cfg.tbMap.nWalkCount;
            local iMapGeneratorSystemSys = iScene:GetSystemByName("MapGeneratorSystem");
            iMapGeneratorSystemSys:GeneratorHandler(function ()
                for _,sActor in ipairs(cfg.tbMap.tbActor) do 
                    iMapGeneratorSystemSys["Create"..sActor](iMapGeneratorSystemSys,iMapCompo);
                end
                local iPlayer = iScene:GetActorByTagType("Player");
                local nPw = iPlayer:GetiCompo("Transform").w;
                local nPh = iPlayer:GetiCompo("Transform").h;
                local tbBorn = iMapCompo.tbRealMapInfo[1]; 
                iPlayer:ChangeiCompoParam({
                    ["Transform"] = { x = tbBorn.x, y = tbBorn.y};
                });
            end);
        end
    end
    if fCallback then fCallback(); end 
end

function ContentMgr:UninstallHandler(iScene,fCallback)
    local tbSystemList = iScene:GetSystemList();
    for _,iSystem in ipairs(tbSystemList) do 
        if iSystem.Destory then 
            iSystem:Destory();
        end
    end
    iScene:UninstallActor();
    iScene:UninstallSystem();
    if fCallback then fCallback(); end 
end