_G.Scene1 = GameChainSystem:DeriveClass("Scene1");

function Scene1:StartHandler()

    self.fileName = ""

    UIMgr:GetUI("btn_2"):SetAttr("bVisible",false);

    UIMgr:GetUI("btn_1"):SetAttr("onClick",function() 
        self.fileName = UIMgr:GetUI("input_1"):GetAttr("sText");
        UIMgr:GetUI("btn_1"):SetAttr("bVisible",false);
        UIMgr:GetUI("input_1"):SetAttr("bVisible",false);
        UIMgr:GetUI("btn_2"):SetAttr("bVisible",true);
    end);

    UIMgr:GetUI("btn_2"):SetAttr("onClick",function()
        UIMgr:GetUI("btn_1"):SetAttr("bVisible",true);
        UIMgr:GetUI("input_1"):SetAttr("bVisible",true);
        UIMgr:GetUI("btn_2"):SetAttr("bVisible",false);
        self.fileName = "";
    end);

end

function Scene1:Render() 
    love.graphics.setColor(1,1,1,1)
    local font = AssetsMgr:GetFont(202);
    love.graphics.setFont(font);
    love.graphics.print(self.fileName,10,10)
end 