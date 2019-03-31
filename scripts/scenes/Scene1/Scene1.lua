_G.Scene1 = GameChainSystem:DeriveClass('Scene1');

function Scene1:StartHandler()
    local iScene = self:GetCurScene();
    local iMapGeneratorSystemSys = iScene:GetSystemByName("MapGeneratorSystem");
    iMapGeneratorSystemSys:GeneratorHandler();
    local iMap = iScene:GetActorByTagType("Map");
    local iMapCompo = iMap:GetiCompo("Map");
    iMapGeneratorSystemSys:CreateTile(iMapCompo);
    iMapGeneratorSystemSys:CreateEdge(iMapCompo);
end

function Scene1:DestoryHandler()

end