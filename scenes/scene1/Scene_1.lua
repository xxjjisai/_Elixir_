
_G.Scene_1 = 
{
    tbActor = 
    {
        { sActorType = "Player", sUseName = "Player1" },
    };

    tbUI = 
    { 
        { sUIType = "ShapeButton", sUseName = "btn_1", tbProperty = {
            sText = "按钮",x = 400, y = 100;
        }},

        { sUIType = "ShapeTextInput", sUseName = "input_1", tbProperty = {
            sText = "",x = 100, y = 100; w = 300;
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