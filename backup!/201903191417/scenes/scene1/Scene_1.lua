
_G.Scene_1 = 
{
    tbActor = 
    {
        { sActorType = "Player", sUseName = "Player1", tbProperty = {
            ["Color"] = {a = 0},
        }},
    };

    tbUI = 
    { 
        { sUIType = "ShapeButton", sUseName = "btn_1", tbProperty = {
            sText = "start",x = 400, y = 100;
        }},

        { sUIType = "ShapeTextInput", sUseName = "input_1", tbProperty = {
            sText = "",x = 100, y = 100; w = 300;
        }},

        { sUIType = "ShapeButton", sUseName = "btn_2", tbProperty = {
            sText = "complete",x = 400, y = 200; w = 90;
        }},

        { sUIType = "ShapeTextInput", sUseName = "input_2", tbProperty = {
            sText = "",x = 100, y = 200; w = 300;
        }},
    },

    tbSystem = 
    {
        "RectangleRenderSystem",
        "LayerSortSystem",
        "SpriteRenderSystem",
        "AnimationSystem",
        "Scene1",
    };
}