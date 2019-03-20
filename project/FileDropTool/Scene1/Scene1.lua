_G.Scene1 = GameChainSystem:DeriveClass('Scene1');

function Scene1:StartHandler()

    self.sContent = nil;

    local gw = graphicsWidth;
    local gh = graphicsHeight;

    UIMgr:GetUI("input_1"):SetAttr("bFiledropped", true)

    UIMgr:GetUI("input_1"):SetAttr("x", 300)
    UIMgr:GetUI("input_1"):SetAttr("w", 0)
    UIMgr:GetUI("input_2"):SetAttr("x", 300)
    UIMgr:GetUI("input_2"):SetAttr("w", 200)
    UIMgr:GetUI("input_2"):SetAttr("y", 200)
    UIMgr:GetUI("input_3"):SetAttr("x", 500)
    UIMgr:GetUI("input_3"):SetAttr("w", 200)
    UIMgr:GetUI("input_3"):SetAttr("y", 200)
    UIMgr:GetUI("btn_1"):SetAttr("y", 300)
    UIMgr:GetUI("btn_1"):SetAttr("w", 100)
    UIMgr:GetUI("btn_1"):SetAttr("x", 450)
    UIMgr:GetUI("btn_1"):SetAttr("sText", "替换")

    
    local ix = UIMgr:GetUI("input_1"):GetAttr("x");
    local iw = UIMgr:GetUI("input_1"):GetAttr("w");
    local bw = UIMgr:GetUI("btn_1"):GetAttr("w");
    local nInputCenterX = (gw * 0.5 - iw * 0.5);
    local nBtnCenterX = nInputCenterX + iw;
    local  nY = 250 

    UIMgr:GetUI("btn_1"):SetAttr("onClick",function ()
        if self.sContent == nil then 
            return 
        end 
        local sOld = UIMgr:GetUI("input_2"):GetAttr("sText");
        local sNew = UIMgr:GetUI("input_3"):GetAttr("sText");
        local content, count = string.gsub(self.sContent, sOld, sNew)
        local file = io.open(self.sFilePath, 'w')
		if file ~= nil then 
			file:write(content);
			file:close();
		end
    end); 

    UIMgr:GetUI("input_1"):SetAttr("onFiledropped", function (file) 
        local data = file:read()
        self.sContent = data;
        local sFilePath = file:getFilename();
        self.sFilePath = sFilePath;
        local font = AssetsMgr:GetFont(182);
        local nFontW = font:getWidth(sFilePath) 
        local inputw = UIMgr:GetUI("input_1"):GetAttr("w");
        inputw = nFontW+20;
        local nInputCenterX = (gw * 0.5 - inputw * 0.5)
        UIMgr:GetUI("input_1"):SetAttr("sText","");
        Tween(2,UIMgr:GetUI("input_1"):GetAttribute(),{ x = nInputCenterX, w = nFontW + 50 },'inOutBack',function () 
            UIMgr:GetUI("input_1"):SetAttr("sText",sFilePath);
        end)
    end)
end

function Scene1:DestoryHandler()

end

        -- local data = file:read()
        -- print("Content of " .. file:getFilename() .. ' is')
        -- print(data)
        -- print("End of file")

        -- local oldStr = "bye"
        -- local newStr = "kkk"
        -- content = data
        -- content, count = string.gsub(content, oldStr, newStr)
        -- print("content",content)