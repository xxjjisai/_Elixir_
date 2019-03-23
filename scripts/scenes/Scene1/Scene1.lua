_G.Scene1 = GameChainSystem:DeriveClass('Scene1');

function Scene1:StartHandler()

    UIMgr:GetUI("grid_1"):SetAttr("x", 100)
    UIMgr:GetUI("grid_1"):SetAttr("y", 100)
    for i = 1 , 13 do 
        UIMgr:CreateUI( "ShapeButton", "btn_"..i, {
            sText = "btn_"..i;onClick = function ()
                -- UIMgr:GetUI("grid_1"):AddItem(UIMgr:CreateUI( "ShapeButton", "btnx"));
                UIMgr:GetUI("grid_1"):DelItem(UIMgr:GetUI("btn_"..i));
            end
        });
        UIMgr:GetUI("grid_1"):AddItem(UIMgr:GetUI("btn_"..i));
    end

end



function Scene1:Update(dt)
    -- UIMgr:GetUI("list_1"):SetAttr("x", UIMgr:GetUI("list_1"):GetAttr("x") + 1)
end

function Scene1:DestoryHandler()

end