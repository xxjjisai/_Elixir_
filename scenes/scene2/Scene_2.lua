
_G.Scene_2 = 
{
    tbActor = 
    {
        { sActorType = "Player", sUseName = "Player1",tbProperty = {
            ["Color"] = { a = 1 };
            ["Animate"] = { sImg = "blockercans", nQuadW = 53, nQuadH = 60, nTotalFrame= 12, nLoop = 1, nTotalPlayCount = 10,nTimeAfterPlay = 0.1 };
        }},
    };

    tbUI = 
    { 
        { sUIType = "ShapeButton", sUseName = "btn_bg", tbProperty = {
            sText = " ",x = 960, y = 0; w = 150, h = 640;
            style = {
                bBg = true;
                bBorder = false;
                sborderFill = "line",
                sbgFill = "fill",
                nFontSize = 182;
                bgcolor = {0.5,0.5,0.5,0.6},
                txtcolor = {0.5,0.5,0.5,0.6},
                bordercolor = {0.5,0.5,0.5,0.6},
                bHoverColor = {0.5,0.5,0.5,0.6},
            };
        }}, 

        { sUIType = "ShapeTextInput", sUseName = "input_name", tbProperty = {
            sText = " ",x = 960, y = 10-10; w = 150; h = 30;
        }}, 

        { sUIType = "ShapeButton", sUseName = "btn_x", tbProperty = {
            sText = "x",x = 960, y = 50-20;
        }}, 

        { sUIType = "ShapeTextInput", sUseName = "input_x", tbProperty = {
            sText = "100",x = 1030, y = 50-20; w = 80; h = 50;
        }},  

        { sUIType = "ShapeButton", sUseName = "btn_y", tbProperty = {
            sText = "y",x = 960, y = 110-30;
        }}, 

        { sUIType = "ShapeTextInput", sUseName = "input_y", tbProperty = {
            sText = "100",x = 1030, y = 110-30; w = 80; h = 50;
        }},  

        { sUIType = "ShapeButton", sUseName = "btn_w", tbProperty = {
            sText = "w",x = 960, y = 170-40;
        }}, 

        { sUIType = "ShapeTextInput", sUseName = "input_w", tbProperty = {
            sText = "100",x = 1030, y = 170-40; w = 80; h = 50;
        }},  

        { sUIType = "ShapeButton", sUseName = "btn_h", tbProperty = {
            sText = "h",x = 960, y = 230-50;
        }}, 
        
        { sUIType = "ShapeTextInput", sUseName = "input_h", tbProperty = {
            sText = "100",x = 1030, y = 230-50; w = 80; h = 50;
        }},  

        { sUIType = "ShapeButton", sUseName = "btn_ui", tbProperty = {
            sText = "UI",x = 960, y = 280-50; w = 70;
        }},

        { sUIType = "ShapeTextInput", sUseName = "input_ui", tbProperty = {
            sText = "Button",x = 1030, y = 280-50; w = 80; h = 50; bNumber = false;
        }},  
        
        { sUIType = "ShapeButton", sUseName = "btn_actor", tbProperty = {
            sText = "Actor",x = 960, y = 330-50; w = 70;
        }}, 
        
        { sUIType = "ShapeTextInput", sUseName = "input_actor", tbProperty = {
            sText = "Player",x = 1030, y = 330-50; w = 80; h = 50;bNumber = false;
        }},  

        { sUIType = "ShapeButton", sUseName = "btn_sText", tbProperty = {
            sText = "sName",x = 960, y = 380-50; w = 70;
        }}, 
        
        { sUIType = "ShapeTextInput", sUseName = "input_sText", tbProperty = {
            sText = "input_1",x = 1030, y = 380-50; w = 80; h = 50;bNumber = false;
        }},  
    },

    tbSystem = 
    {
        "RectangleRenderSystem",
        "LayerSortSystem",
        "SpriteRenderSystem",
        "AnimationSystem",
        "Scene2",
    };
}