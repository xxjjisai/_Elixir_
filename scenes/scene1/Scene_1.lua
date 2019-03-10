
_G.Scene_1 = 
{
    tbActor = 
    {
        { sActorType = "Player", sUseName = "Player1",tbProperty = {
            ["Transform"] = { x=100, y=0, w=64, h=128, sx=1, sy=1, ox=0, oy=0, r=0 };
        }},
        
        { sActorType = "Player", sUseName = "Player2",tbProperty = {
            ["Transform"] = { x=100, y=100, w=64, h=128, sx=1, sy=1, ox=0, oy=0, r=0 };
            ["Color"] = { r = 1, g = 0, b = 0, a = 1 };
        }},
    };

    tbUI = 
    { 
        { sUIType = "ShapeButton", sUseName = "btn_1", tbProperty = {
            sText = "你好",x = 200, y = 100; w = 300;
        }},

        { sUIType = "ShapeTextInput", sUseName = "input_1", tbProperty = {
            sText = "你好",x = 100, y = 100;
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