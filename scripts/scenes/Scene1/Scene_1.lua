_G.Scene_1 = 
{
    tbActor = 
    {
        { sActorType = 'Player', sUseName = 'Player1' },
        { sActorType = "Map", sUseName = 'Map1' },
    };

    tbMap = 
    {
        nWalkCount = 200;
        tbActor = {"Tile", "Edge"};
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
        'Scene1',
    };
}