local PlayerConfig = 
{
    ["Transform"] = { x=0, y=0, w=64, h=64 };
    ["Color"] = { r = 1, g = 1, b = 1, a = 1 };
    ["RenderLayer"] = { nLayerIndex = RenderLayerType.nPlayer };
    ["HateList"] = { }; 
    ["SightRange"] = { nSightRange = 100}; 
    ["Rectangle"] = { sFillType = "fill"}; 
    -- ["Sprite"] = { sImg = "hero_001" };
    -- ["Animate"] = { sImg = "blockercans", nQuadW = 53, nQuadH = 60, nTotalFrame= 12, nLoop = 1, nTotalPlayCount = 10,nTimeAfterPlay = 0.1 };
}
return PlayerConfig