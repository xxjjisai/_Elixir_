_G.Scene_1 = 
{
    tbActor = 
    {
        { sActorType = 'Player', sUseName = 'Player1' ,tbProperty = {
            ["SightRange"] = { nSightRange = 20000}; 
            -- ["Sprite"] = { sImg = "001" };
        }},
        { sActorType = 'Map', sUseName = 'Map1' },
        { sActorType = 'Enemy', sUseName = 'Enemy1',tbProperty = {
            -- ['Color'] = { r = 1, g = 0, b = 0, a = 1 };
            -- ["Sprite"] = { sImg = "008" };
            ["Animate"] = { sImg = "hero_ani_5", nQuadW = 100, nQuadH = 100, nTotalFrame= 4, nLoop = 1, nTotalPlayCount = 10,nTimeAfterPlay = 0.1 };
        }},
        { sActorType = 'Enemy', sUseName = 'Enemy2',tbProperty = {
            -- ['Color'] = { r = 1.00, g = 0.65, b = 0.00, a = 1 };
            ["Animate"] = { sImg = "hero_ani_6", nQuadW = 100, nQuadH = 100, nTotalFrame= 4, nLoop = 1, nTotalPlayCount = 10,nTimeAfterPlay = 0.1 };
        }},
        { sActorType = 'Enemy', sUseName = 'Enemy3',tbProperty = {
            -- ['Color'] = { r = 1, g = 1, b = 0, a = 1 };
            ["Sprite"] = { sImg = "003" };
        }},
        { sActorType = 'Enemy', sUseName = 'Enemy4',tbProperty = {
            -- ['Color'] = { r = 0, g = 1, b = 0, a = 1 };
            ["Sprite"] = { sImg = "008" };
        }},
        { sActorType = 'Enemy', sUseName = 'Enemy5',tbProperty = {
            -- ['Color'] = { r = 0, g = 0.5, b = 1, a = 1 };
            ["Animate"] = { sImg = "hero_ani_6", nQuadW = 100, nQuadH = 100, nTotalFrame= 4, nLoop = 1, nTotalPlayCount = 10,nTimeAfterPlay = 0.1 };
        }},
        { sActorType = 'Enemy', sUseName = 'Enemy6',tbProperty = {
            -- ['Color'] = { r =0, g = 0, b = 1, a = 1 };
            ["Sprite"] = { sImg = "003" };
        }},
        { sActorType = 'Enemy', sUseName = 'Enemy7',tbProperty = {
            -- ['Color'] = { r = 1, g =0, b = 1, a = 1 };
            ["Sprite"] = { sImg = "012" };
        }},
    };

    tbActionActor = 
    {
        "Enemy"
    };

    tbMap = 
    {
        nWalkCount = 150;
        tbActor = {'Tile', 'TileBottomEdge'};
    };

  -- tbUI = 
  -- { 
  --     { sUIType = 'ShapeButton', sUseName = 'btn_1' },
  --     { sUIType = 'ShapeTextInput', sUseName = 'input_1' },
  --     { sUIType = 'ShapeList', sUseName = 'list_1' },
  --     { sUIType = 'ShapeGrid', sUseName = 'grid_1' },
  -- },

    tbSystem = 
    {
        'RectangleRenderSystem',
        'SpriteRenderSystem',
        'AnimationSystem',
        'MapGeneratorSystem',
        'LayerSortSystem',
        'GridWalkSystem',
        'FindPathSystem',
        'PlayerTweenMoveSystem',
        'EnemyGridWalkSystem',
        'EnemyTweenMoveSystem',
        'ColorSystem',
        'Scene1',
    };
}