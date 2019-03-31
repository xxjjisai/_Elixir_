_G.Scene_1 = 
{
    tbActor = 
    {
        { sActorType = 'Player', sUseName = 'Player1' },
        { sActorType = 'Player', sUseName = 'Player2' },
        { sActorType = "Map"; tbProperty = { ["Map"] = { nCellCount = 1115 } }},
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
        'Scene1',
    };
}