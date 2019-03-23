local ShapeProgress = {};
function ShapeProgress:Create(sClassName)
   local obj = UI:DeriveClass(sClassName);
   obj.iChild = nil

   local function StencilFunction()
      love.graphics.rectangle("fill", obj:GetAttr("x"),obj:GetAttr("y"),obj:GetAttr("w"),obj:GetAttr("h"));
   end

   function obj:Init()
      self.iChild = {};
      self.iChild.x = 0; 
      self.iChild.y = 0; 
      self.iChild.tbItems = {}; 
      love.graphics.stencil(StencilFunction, self:GetAttr("sStencilAction"), 1);
   end

   function obj:AddInPanel(iChild)
      iChild:SetAttr("bInPanel",true);
      self.iChild = self.iChild or {};
      self.iChild.tbItems = self.iChild.tbItems or {};
      self.iChild.tbItems[iChild.sClassName] = iChild;
      -- self:Trace(1,"Start~~~~~self.iChild.tbItems~~~~~",table.show(self.iChild.tbItems,'self.iChild.tbItems'))
   end
   
   function obj:GetPanelChildren()
      return self.iChild;
   end

   function obj:GetPanelChildByName(sClassName)
      return self.iChild.tbItems[sClassName];
   end

   function obj:Clear()
      self.iChild.tbItems = {};
   end

   function obj:Update(dt)
      if next(self.iChild.tbItems) then 
         for _,iUI in pairs(self.iChild.tbItems) do 
            if self:GetAttr("bV") then 
               iUI:SetAttr("y", iUI:GetAttr("y") + self.iChild.y)
            else 
               iUI:SetAttr("x", iUI:GetAttr("x") + self.iChild.x)
            end
         end 
      end 
   end

   function obj:Render()
      love.graphics.stencil(StencilFunction, "replace", 1)
      love.graphics.setStencilTest("greater", 0)
      if next(self.iChild.tbItems) then 
         for _,iUI in pairs(self.iChild.tbItems) do 
            if iUI.Render then 
               iUI:Render()
            end
         end 
      end 
      love.graphics.setStencilTest()
      love.graphics.setColor(0,0,0,1)
      love.graphics.rectangle("line", self:GetAttr("x"),self:GetAttr("y"),self:GetAttr("w"),self:GetAttr("h"));
      love.graphics.setColor(1,1,1,1)
   end

   function obj:MouseDown(x,y,button,istouch, presses)
      if not self:GetAttr("bVisible") then 
         return 
      end 
      
      if not self:GetAttr("bEnabled") then 
         return 
      end  

   end

   return obj;
end

return ShapeProgress;