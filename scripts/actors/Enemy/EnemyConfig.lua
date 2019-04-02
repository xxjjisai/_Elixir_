local EnemyConfig = 
{
    ['Transform'] = { x=100, y=100, w=53, h=60 };
    ['Color'] = { r = 1, g = 1, b = 1, a = 1 };
    ['RenderLayer'] = { nLayerIndex = RenderLayerType.nPlayer };
    ["Animate"] = { sImg = "blueanims", nQuadW = 53, nQuadH = 60, nTotalFrame= 29, nLoop = 1, nTotalPlayCount = 10,nTimeAfterPlay = 0.1 };
}
return EnemyConfig
