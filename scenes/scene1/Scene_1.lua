
_G.Scene_1 = 
{
    tbActor = 
    {
        { sActorType = "Player"; sUseName = "Player1",tbProperty={
            ["Transform"] = { x=0, y=0, w=64, h=128, sx=1, sy=1, ox=0, oy=0, r=0 };
        }},
    };

    tbUI = 
    { 
        { sUIType = "ShapeButton", sUseName = "btn_1",tbProperty = {
            sText = "btn_1",
            x = 100, y = 100, w = 70, h = 50;
        }},

        { sUIType = "ShapeButton", sUseName = "btn_2",tbProperty = {
            sText = "btn_2",
            x = 180, y = 100, w = 70, h = 50;
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