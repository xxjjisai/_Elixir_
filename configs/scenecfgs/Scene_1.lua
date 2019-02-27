
_G.Scene_1 = 
{
    tbActor = 
    {
        { sActorType = "Player"; },
    };

    tbUI = 
    { 
        { sUIType = "ShapeButton", sUseName = "btn_1", tbProperty = {
            sName = "黑色";
            x = 50; y = 470;
            w = 70; h = 50;
            style = {
                bBg = false;
                bBorder = false;  
                bgcolor = {1,0,0,1},
                txtcolor = {1,1,1,1},
                sborderFill = "line",
                sbgFill = "fill",
                bordercolor = {1,1,1,1},
                nFontSize = 202; bHoverColor = {0.5,0.5,1,1},
            }
        }}, 
        { sUIType = "ShapeButton", sUseName = "btn_1", tbProperty = {
            sName = "红色";
            x = 130; y = 470;
            w = 70; h = 50;
            style = {
                bBg = false;
                bBorder = false;  
                bgcolor = {1,0,0,1},
                txtcolor = {1,1,1,1},
                sborderFill = "line",
                sbgFill = "fill",
                bordercolor = {1,1,1,1},
                nFontSize = 202; bHoverColor = {0.5,0.5,1,1},
            }
        }}, 
        { sUIType = "ShapeButton", sUseName = "btn_1", tbProperty = {
            sName = "|";
            x = 120; y = 470;
            w = 10; h = 50;
            style = {
                bBg = false;
                bBorder = false;  
                bgcolor = {1,0,0,1},
                txtcolor = {1,1,1,1},
                sborderFill = "line",
                sbgFill = "fill",
                bordercolor = {1,1,1,1},
                nFontSize = 202; bHoverColor = {0.5,0.5,1,1},
            }
        }}, 
    },

    tbSystem = 
    {
        "RectangleRenderSystem",
        "LayerSortSystem",
        "SpriteRenderSystem",
        "AnimationSystem",
        "KeyBoardMoveSystem",
        "Scene1",
    };
}