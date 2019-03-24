local ShapeScrollView = {};
function ShapeScrollView:Create(sClassName)
   local obj = UI:DeriveClass(sClassName);
   obj.iChild = nil;
   obj.iBar = {
      x = 0;
      y = 0;
      w = 20;
      h = 0;
   };

   local function StencilFunction()
      love.graphics.rectangle("fill", obj:GetAttr("x"),obj:GetAttr("y"),obj:GetAttr("w"),obj:GetAttr("h"));
   end

   function obj:Init()
      love.graphics.stencil(StencilFunction, self:GetAttr("sStencilAction"), 1);
   end

   function obj:AddItem(iChild)
      if not iChild.tbChildren then 
         self:Trace(3,"Has no Child!!!!!!!!!!!!");
         return 
      end
      self.iChild = iChild;
      self.iChild:SetAttr("x", self:GetAttr("x"));
      self.iChild:SetAttr("y", self:GetAttr("y"));
      for i,iUI in ipairs(self.iChild.tbChildren) do 
         iUI:SetAttr("bInPanel",true);
      end
      
      self:Trace(1,self.iChild:GetAttr("w"))

      self:SetAttr("w",self.iChild:GetAttr("w"))
  
   end

   function obj:Render()
      love.graphics.stencil(StencilFunction, "replace", 1)
      love.graphics.setStencilTest("greater", 0)
      if self.iChild then 
         for _,iUI in pairs(self.iChild.tbChildren) do 
            if iUI.Render then 
               iUI:Render()
            end
         end 
      end 
      love.graphics.setStencilTest()
      love.graphics.setColor(0,0,0,1)
      -- love.graphics.rectangle("line", self:GetAttr("x"),self:GetAttr("y"),self:GetAttr("w"),self:GetAttr("h"));
      love.graphics.setColor(1,1,1,1)

      -- 滚动条
      -- if self.iBar then 
      --    love.graphics.setColor(0,0,0,0.2)
      --    love.graphics.rectangle("fill",self.iBar.x,self.iBar.y,self.iBar.w,self.iBar.h)
      -- end 

      -- love.graphics.setColor(1,1,1,1)
   end

   function obj:WheelMoved(x, y) 
      if not self:GetAttr("bHover") then 
         return 
      end 
      local ncy = self.iChild:GetAttr("y");
      local nch = self.iChild:GetAttr("h");
      local npy = self:GetAttr("y");
      local nph = self:GetAttr("h");

      if y == 1 then -- 上  
         if ncy + nch <= npy + nph then 
            local nOffest = (npy + nph) - (ncy + nch)
            self.iChild:SetAttr("y",self.iChild:GetAttr("y") + nOffest)
            return 
         end 
         self.iChild:SetAttr("y",self.iChild:GetAttr("y") - self.iChild:GetAttr("nCellHeight"))
      elseif y == -1 then -- 下
         if ncy >= npy then 
            local nOffest = npy
            self.iChild:SetAttr("y",nOffest)
            return
         end 
         self.iChild:SetAttr("y",self.iChild:GetAttr("y") + self.iChild:GetAttr("nCellHeight"))
      end
   end

   function obj:Update(dt)
      if not self:GetAttr("bVisible") then 
         return 
      end 
      local tbMouse = {
         x = love.mouse.getX(),
         y = love.mouse.getY(),
         w = 1,
         h = 1
      }
      local tbButton = {
         x = self:GetAttr("x"),
         y = self:GetAttr("y"),
         w = self:GetAttr("w"),
         h = self:GetAttr("h")
      }
      if hitTestObject(tbMouse,tbButton) then  
         self:SetAttr("bHover",true); 
         if self:GetAttr("onHover") then  
            if not self:GetAttr("bHoverMove") then  
               self:GetAttr("onHover")();
               self:SetAttr("bHoverMove",true);
            end
         end
      else
         self:SetAttr("bHover",false); 
         self:SetAttr("bHoverMove",false);
      end  

      local ncy = self.iChild:GetAttr("y");
      local nch = self.iChild:GetAttr("h");
      local npy = self:GetAttr("y");
      local nph = self:GetAttr("h");

      if ncy + nch <= npy + nph then 
         local nOffest = (npy + nph) - (ncy + nch)
         self.iChild:SetAttr("y",self.iChild:GetAttr("y") + nOffest)
      end 

      if ncy >= npy then 
         local nOffest = npy
         self.iChild:SetAttr("y",nOffest)
      end 

   end

   return obj;
end

return ShapeScrollView;