_G.Scene_2 = 
{
    tbActor = 
    {
        { sActorType = 'Player', sUseName = 'Player1' },
        { sActorType = 'Map', sUseName = 'Map1' },

        -- { sActorType = 'Enemy', sUseName = 'Enemy1' },
        -- { sActorType = 'Enemy', sUseName = 'Enemy2' },
        -- { sActorType = 'Enemy', sUseName = 'Enemy3' },
        -- { sActorType = 'Enemy', sUseName = 'Enemy4' },
        -- { sActorType = 'Enemy', sUseName = 'Enemy5' },
        -- { sActorType = 'Enemy', sUseName = 'Enemy6' },
        -- { sActorType = 'Enemy', sUseName = 'Enemy7' },

        -- { sActorType = 'Enemy', sUseName = 'Enemy8' },
        -- { sActorType = 'Enemy', sUseName = 'Enemy9' },
        -- { sActorType = 'Enemy', sUseName = 'Enemy10' },
    };

    tbMap = 
    {
        nWalkCount = 130;
        tbActor = {'Tile', 'Edge', 'Rock1','Rock2','Flower1','Flower2','Born1','Born2' };
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