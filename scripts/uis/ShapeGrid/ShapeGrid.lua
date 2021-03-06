local ShapeGrid = {};
function ShapeGrid:Create(sClassName)
   local obj = UI:DeriveClass(sClassName);
   obj.tbChildren = {};

   function obj:AddItem(iUI)
      if not self:GetAttr("bVisible") then 
         return 
      end 
      table.insert(self.tbChildren,iUI);
      self:ResetPosHandler()
   end

   function obj:DelItem(iUI)
      if not self:GetAttr("bVisible") then 
         return 
      end 
      if iUI == nil then return end
      local nDelIndex = 0;
      for i,v in ipairs(self.tbChildren) do 
         if v.sClassName == iUI.sClassName then 
            nDelIndex = i;
            break;
         end
      end
      self:Trace(1,nDelIndex,iUI.sClassName)
      if nDelIndex == 0 then return end
      self:Trace(2,nDelIndex,#self.tbChildren)
      table.remove(self.tbChildren,nDelIndex);
      self:Trace(2,#self.tbChildren)
      UIMgr:RemoveUI(iUI.sUseName)
      self:ResetPosHandler();
   end

   function obj:ResetPosHandler()
      if not self:GetAttr("bVisible") then 
         return 
      end 
      self:SetAttr("nCol",1);
      self:SetAttr("nRow",1);
      local nGridWidth = 0;
      local nGridHeight = 0;
      for i,iUI in ipairs(self.tbChildren) do 
         self:SetAttr("nCellWidth",iUI:GetAttr("w"));
         self:SetAttr("nCellHeight",iUI:GetAttr("h"));
         iUI:SetAttr("x",self:GetAttr("x") + self:GetAttr("nRow") * (self:GetAttr("nCellWidth") + self:GetAttr("nSpace")) - self:GetAttr("nCellWidth"));
         iUI:SetAttr("y",self:GetAttr("y") + self:GetAttr("nCol") * (self:GetAttr("nCellHeight") + self:GetAttr("nSpace")) - self:GetAttr("nCellHeight"));
         if i % self:GetAttr("nLength") == 0 then 
            self:SetAttr("nCol",self:GetAttr("nCol") + 1)
            self:SetAttr("nRow",0)
         end 
         self:SetAttr("nRow",self:GetAttr("nRow") + 1)
      end 

      nGridWidth =  (self:GetAttr("nCellWidth") + self:GetAttr("nSpace")) * self:GetAttr("nLength")
      nGridHeight = (self:GetAttr("nCellHeight") + self:GetAttr("nSpace")) * self:GetAttr("nCol")
      self:SetAttr("w",nGridWidth)
      self:SetAttr("h",nGridHeight)
   end

   function obj:Update(dt)
      if not self:GetAttr("bVisible") then 
         return 
      end 
      self:ResetPosHandler();
   end

   function obj:Hide()
      self:SetAttr("bVisible",false)
      for i,iUI in ipairs(self.tbChildren) do 
         iUI:SetAttr("bVisible",false)
      end 
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
   --    love.graphics.rectangle(self:GetAttr("style").sborderFill,self:GetAttr("x") ,self:GetAttr("y"),self:GetAttr("w"),self:GetAttr("h"))
   -- end

   return obj;
end

return ShapeGrid;