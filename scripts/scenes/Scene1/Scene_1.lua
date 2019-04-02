_G.Scene_1 = 
{
    tbActor = 
    {
        { sActorType = 'Player', sUseName = 'Player1' },
        { sActorType = 'Map', sUseName = 'Map1' },
        { sActorType = 'Enemy', sUseName = 'Enemy1' },
        { sActorType = 'Enemy', sUseName = 'Enemy2' },
        -- { sActorType = 'Enemy', sUseName = 'Enemy3' },
        -- { sActorType = 'Enemy', sUseName = 'Enemy4' },
        -- { sActorType = 'Enemy', sUseName = 'Enemy5' },
        -- { sActorType = 'Enemy', sUseName = 'Enemy6' },
    };

    tbMap = 
    {
        nWalkCount = 30;
        tbActor = {'Tile', 'Edge'};
    };

    tbUI = 
    { 
        -- { sUIType = 'ShapeButton', sUseName = 'btn_1' },
        -- { sUIType = 'ShapeTextInput', sUseName = 'input_1' },
        -- { sUIType = 'ShapeList', sUseName = 'list_1' },
        -- { sUIType = 'ShapeGrid', sUseName = 'grid_1' },
    },

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
        'Scene1',
    };
}