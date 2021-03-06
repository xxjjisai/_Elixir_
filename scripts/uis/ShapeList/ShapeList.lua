local ShapeList = {};
function ShapeList:Create(sClassName)
   local obj = UI:DeriveClass(sClassName);
   obj.tbChildren = {};

   function obj:AddItem(iUI) 
      if not self:GetAttr("bVisible") then 
         return 
      end 
      table.insert(self.tbChildren,iUI);
      self:ResetPosHandler(); 
   end

   function obj:Update(dt)
      if not self:GetAttr("bVisible") then 
         return 
      end 
      self:ResetPosHandler();
   end

   function obj:ResetPosHandler()
      if not self:GetAttr("bVisible") then 
         return 
      end 
      local iLastUI = nil;
      for i,v in ipairs(self.tbChildren) do 
         self:SetAttr("nCellWidth",v:GetAttr("w"));
         self:SetAttr("nCellHeight",v:GetAttr("h")); 
         if i == 1 then 
            v:SetAttr("y", self:GetAttr("y"));
            v:SetAttr("x", self:GetAttr("x"));
            self:SetAttr("w", v:GetAttr("w"));
            self:SetAttr("h", v:GetAttr("h"));
         else 
            local nFinalX = iLastUI:GetAttr("x");
            local nFinalY = iLastUI:GetAttr("y");
            local nFinalW = iLastUI:GetAttr("w");
            local nFinalH = iLastUI:GetAttr("h");
            if self:GetAttr("bV") then 
               v:SetAttr("y", nFinalY + nFinalH + self:GetAttr("nSpace"));
               v:SetAttr("x", nFinalX);
               self:SetAttr("h", self:GetAttr("h") + nFinalH + self:GetAttr("nSpace"));
            else 
               v:SetAttr("x", nFinalX + nFinalW + self:GetAttr("nSpace"));
               v:SetAttr("y", nFinalY);
               self:SetAttr("w", self:GetAttr("w") + nFinalW + self:GetAttr("nSpace"));
            end
         end
         iLastUI = v;
      end
   end

   function obj:Hide()
      for i,iUI in ipairs(self.tbChildren) do 
         iUI:SetAttr("bVisible",false)
      end 
      self:SetAttr("bVisible",false)
   end

   function obj:Show()
      for i,iUI in ipairs(self.tbChildren) do 
         iUI:SetAttr("bVisible",true)
      end 
      self:SetAttr("bVisible",true)
   end

   -- function obj:Render()
   --    if not self:GetAttr("bVisible") then 
   --       return 
   --    end 
   --    local bBorder = self:GetAttr("style").bBorder;
   --    if not bBorder then
   --       return
   --    end
   --    local bordercolor = self:GetAttr("style").bordercolor;
   --    love.graphics.setColor(bordercolor);
   --    love.graphics.rectangle(self:GetAttr("style").sborderFill,self:GetAttr("x"),self:GetAttr("y"),self:GetAttr("w"),self:GetAttr("h"))
   -- end

   return obj;
end

return ShapeList;