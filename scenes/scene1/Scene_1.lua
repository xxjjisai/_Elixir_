
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
        { sUIType = "ShapeTextInput", sUseName = "input_1",tbProperty = {
            sText = "",
            x = 150, y = 260, w = 570, h = 50;
        }},

        { sUIType = "ShapeButton", sUseName = "btn_1",tbProperty = {
            sText = "确定",
            x = 730, y = 260, w = 70, h = 50;
        }},

        { sUIType = "ShapeButton", sUseName = "btn_2",tbProperty = {
            sText = "返回",
            x = 960-80, y = 20, w = 70, h = 50;
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