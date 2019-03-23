_G.Scene1 = GameChainSystem:DeriveClass('Scene1');

function Scene1:StartHandler()

    for i = 1 , 10 do 
        UIMgr:CreateUI( "ShapeButton", "btn_"..i );
        UIMgr:GetUI("list_1"):AddItem(UIMgr:GetUI("btn_"..i));
    end

end

function Scene1:DestoryHandler()

end