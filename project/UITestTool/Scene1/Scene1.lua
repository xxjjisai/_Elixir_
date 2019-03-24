_G.Scene1 = GameChainSystem:DeriveClass('Scene1');

function Scene1:StartHandler()

    -- UIMgr:GetUI("grid_1"):SetAttr("x", 300)
    -- UIMgr:GetUI("grid_1"):SetAttr("y", 100)
    -- for i = 1 , 13 do 
    --     UIMgr:GetUI("grid_1"):AddItem(UIMgr:CreateUI( "ShapeButton", "btn_"..i ));
    --     UIMgr:GetUI("btn_"..i ):SetAttr("sText","btn_"..i)
    -- end

    -- local tbBtnInfo = {
    --     [1] = { sText = "add" };
    --     [2] = { sText = "del" };
    -- }

    -- local tbInputInfo = {
    --     [1] = { sText = " " };
    --     [2] = { sText = " " };
    -- }

    -- UIMgr:GetUI("list_1"):SetAttr("x", 0)
    -- UIMgr:GetUI("list_1"):SetAttr("y", 0)
    -- for i = 1 , #tbBtnInfo do 
    --     UIMgr:CreateUI( "ShapeButton", "btn_"..tbBtnInfo[i].sText, {
    --         sText = tbBtnInfo[i].sText;
    --         onClick = function ()
    --             local nValue = UIMgr:GetUI("input_"..i ):GetAttr("sText")
    --             if tbBtnInfo[i].sText == "add" then 
    --                 local btn = UIMgr:CreateUI( "ShapeButton", "btn_"..nValue )
    --                 btn:SetAttr("sText","btn_"..nValue);
    --                 UIMgr:GetUI("grid_1"):AddItem(btn);
    --             end
    --             if tbBtnInfo[i].sText == "del" then 
    --                 local btn = UIMgr:GetUI("btn_"..nValue)
    --                 UIMgr:GetUI("grid_1"):DelItem(btn);
    --             end
    --         end
    --     }); 
    --     UIMgr:GetUI("list_1"):AddItem(UIMgr:GetUI("btn_"..tbBtnInfo[i].sText)); 
    -- end

    -- UIMgr:GetUI("list_2"):SetAttr("x", 70)
    -- UIMgr:GetUI("list_2"):SetAttr("y", 0)
    -- for i = 1 , #tbInputInfo do  
    --     UIMgr:CreateUI( "ShapeTextInput", "input_"..i );
    --     UIMgr:GetUI("list_2"):AddItem(UIMgr:GetUI("input_"..i ));
    -- end


    -- UIMgr:GetUI("input_1"):SetAttr("y", 0)
    -- UIMgr:GetUI("grid_1"):SetAttr("nLength", 2)
    -- for i = 1, 80 do 
    --     local btn = UIMgr:CreateUI( "ShapeButton", "btn_"..i )
    --     btn:SetAttr("sText", i)
    --     btn:SetAttr("onClick", function ()
    --         local nValue = btn:GetAttr("sText")
    --         UIMgr:GetUI("input_1"):SetAttr("sText", nValue)
    --     end)
    --     UIMgr:GetUI("grid_1"):AddItem(btn);
    -- end
    -- UIMgr:GetUI("ssv_1"):SetAttr("x", 100)
    -- UIMgr:GetUI("ssv_1"):SetAttr("y", 100)
    -- UIMgr:GetUI("ssv_1"):SetAttr("w", 900)
    -- UIMgr:GetUI("ssv_1"):SetAttr("h", 500)
    -- UIMgr:GetUI("ssv_1"):AddItem(UIMgr:GetUI("grid_1"));

end

function Scene1:DestoryHandler()

end