_G.Scene2 = GameChainSystem:DeriveClass("Scene2");

Scene2.tbItemList = {};
Scene2.iCurUI = nil;

function Scene2:StartHandler()
    
    love.window.setMode(1110, 640);
    local iScene = self:GetCurScene();
    local iPlayer = iScene:GetPlayer(1);
    local cfgScene = Scene_2;
    local tbActor = cfgScene.tbActor;
    local tbUI = cfgScene.tbUI;

    UIMgr:GetUI("btn_x"):SetAttr("onClick", function()
        local x = UIMgr:GetUI("input_x"):GetAttr("sText");
        if not self.iCurUI then return end;
        self.iCurUI:SetAttr("x",tonumber(x));
    end)

    UIMgr:GetUI("btn_y"):SetAttr("onClick", function()
        local y = UIMgr:GetUI("input_y"):GetAttr("sText");
        if not self.iCurUI then return end;
        self.iCurUI:SetAttr("y",tonumber(y));
    end)

    UIMgr:GetUI("btn_w"):SetAttr("onClick", function()
        local w = UIMgr:GetUI("input_w"):GetAttr("sText");
        if not self.iCurUI then return end;
        self.iCurUI:SetAttr("w",tonumber(w));
    end)

    UIMgr:GetUI("btn_h"):SetAttr("onClick", function()
        local h = UIMgr:GetUI("input_h"):GetAttr("sText");
        if not self.iCurUI then return end;
        self.iCurUI:SetAttr("h",tonumber(h));
    end)

    UIMgr:GetUI("btn_ui"):SetAttr("onClick", function()
        local sType = UIMgr:GetUI("input_ui"):GetAttr("sText");
        if sType == "Button" then 
            local iUI = UIMgr:CreateUI("ShapeButton",sType);
            table.insert(self.tbItemList,iUI)
        elseif sType == "Input" then 
            local iUI = UIMgr:CreateUI("ShapeTextInput",sType);
            table.insert(self.tbItemList,iUI)
        end 
    end)

    UIMgr:GetUI("btn_sText"):SetAttr("onClick", function()
        local sText = UIMgr:GetUI("input_sText"):GetAttr("sText");
        if not self.iCurUI then return end;
        self.iCurUI:SetAttr("sText",sText);
    end)
 
end

function Scene2:Update(dt)
    if not self.iCurUI then UIMgr:GetUI("input_name"):SetAttr("sText"," "); return end;
    UIMgr:GetUI("input_name"):SetAttr("sText",self.iCurUI:GetAttr("sText"));
end

function Scene2:MouseDown(x,y,button,istouch, presses)
    local tbMouse = {
        x = x,
        y = y,
        w = 1,
        h = 1
    }
    for _,iUI in ipairs(self.tbItemList) do 
        local tbButton = {
            x = iUI:GetAttr("x"),
            y = iUI:GetAttr("y"),
            w = iUI:GetAttr("w"),
            h = iUI:GetAttr("h")
        }
        if hitTestObject(tbMouse,tbButton) then 
            self.iCurUI = iUI; 
            self:TongBuData();
            break;
        end
    end  
end

function Scene2:TongBuData()
    local ox = self.iCurUI:GetAttr("x");
    local oy = self.iCurUI:GetAttr("y");
    local ow = self.iCurUI:GetAttr("w");
    local oh = self.iCurUI:GetAttr("h");
    local sText = self.iCurUI:GetAttr("sText");
    UIMgr:GetUI("input_x"):SetAttr("sText",ox);
    UIMgr:GetUI("input_y"):SetAttr("sText",oy);
    UIMgr:GetUI("input_w"):SetAttr("sText",ow);
    UIMgr:GetUI("input_h"):SetAttr("sText",oh);
    UIMgr:GetUI("input_sText"):SetAttr("sText",sText);
end