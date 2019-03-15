
_G.Scene_3 = 
{
    tbActor = 
    {
        { sActorType = "Player", sUseName = "Player1" },
    };

    tbUI = 
    { 
        { sUIType = "ShapeButton", sUseName = "btn_1", tbProperty = {
            sText = "确定",x = 400, y = 100;
        }},

        -- { sUIType = "ShapeTextInput", sUseName = "input_1", tbProperty = {
        --     sText = "",x = 100, y = 100; w = 300;
        -- }},
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