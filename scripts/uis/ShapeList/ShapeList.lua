local ShapeList = {};
function ShapeList:Create(sClassName)
   local obj = UI:DeriveClass(sClassName);
   obj.tbChildren = {};

   function obj:AddItem(iUI)
      local len = #self.tbChildren
      table.insert(self.tbChildren,iUI);
      if len <= 0 then
         iUI:SetAttr("y", self:GetAttr("y"));
         iUI:SetAttr("x", self:GetAttr("x"));
         self:SetAttr("w", iUI:GetAttr("w"));
         self:SetAttr("h", iUI:GetAttr("h"));
         return
      end
      local iLastUI = self.tbChildren[len];
      local nFinalX = iLastUI:GetAttr("x");
      local nFinalY = iLastUI:GetAttr("y");
      local nFinalW = iLastUI:GetAttr("w");
      local nFinalH = iLastUI:GetAttr("h");

      if self:GetAttr("bV") then 
         iUI:SetAttr("y", nFinalY + nFinalH + self:GetAttr("nSpace"));
         iUI:SetAttr("x", nFinalX);
         self:SetAttr("h", self:GetAttr("h") + nFinalH + self:GetAttr("nSpace"));
      else 
         iUI:SetAttr("x", nFinalX + nFinalW + self:GetAttr("nSpace"));
         iUI:SetAttr("y", nFinalY);
         self:SetAttr("w", self:GetAttr("w") + nFinalW + self:GetAttr("nSpace"));
      end
   end

   function obj:Render()
      if not self:GetAttr("bVisible") then 
         return 
      end 
      local bBorder = self:GetAttr("style").bBorder;
      if not bBorder then
         return
      end
      local bordercolor = self:GetAttr("style").bordercolor;
      love.graphics.setColor(bordercolor);
      love.graphics.rectangle(self:GetAttr("style").sborderFill,self:GetAttr("x"),self:GetAttr("y"),self:GetAttr("w"),self:GetAttr("h"))
   end

   return obj;
end

return ShapeList;