_G.Scene1 = GameChainSystem:DeriveClass("Scene1");

function Scene1:StartHandler()

    local iScene = self:GetCurScene();
    local iPlayer = iScene:GetPlayer(1);

    UIMgr:GetUI("btn_1"):SetStyle("bgcolor",{0.3,0.3,1,0})
    UIMgr:GetUI("btn_1"):SetStyle("txtcolor",{1,1,1,0})
    Tween(5,UIMgr:GetUI("btn_1"):GetStyle(),{ bgcolor = {0.3,0.3,1,1}, txtcolor = {1,1,1,1}},'inOutBack',function ()
        UIMgr:GetUI("btn_1"):SetAttr("onClick", function ()
            Tween(2,UIMgr:GetUI("btn_1"):GetAttribute(),{ w = UIMgr:GetUI("btn_1"):GetAttr("w") + 200 },'inOutBack',function () end)
        end)
    end)
 
end