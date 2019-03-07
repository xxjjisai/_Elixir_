
_G.Scene_1 = 
{
    tbActor = 
    {
        { sActorType = "Player", sUseName = "Player1",tbProperty ={
            ["Color"] = { a = 0 },
        } },
    };

    tbUI = 
    { 
        
        { sUIType = "ShapeTextInput", sUseName = "input_X",tbProperty = {
            sText = "0",
            bNumber = true,
            x = 50, y = 100, w = 80, h = 50;
        }},

        { sUIType = "ShapeTextInput", sUseName = "input_Y",tbProperty = {
            sText = "0",
            bNumber = true,
            x = 50, y = 200, w = 80, h = 50;
        }},
        
        { sUIType = "ShapeButton", sUseName = "btn_1",tbProperty = {
            sText = "X",
            x = 130, y = 100, w = 70, h = 50;
        }},
        
        { sUIType = "ShapeButton", sUseName = "btn_2",tbProperty = {
            sText = "Y",
            x = 130, y = 200, w = 70, h = 50;
        }},
    },

    tbSystem = 
    {
        "RectangleRenderSystem",
        "LayerSortSystem",
        "UILayerSortSystem",
        "SpriteRenderSystem",
        "AnimationSystem",
        "Scene1",
    };
}