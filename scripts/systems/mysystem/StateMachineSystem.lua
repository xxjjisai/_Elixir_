_G.StateMachineSystem = System:DeriveClass("StateMachineSystem");

StateMachineSystem:SetRegisterCompo{
   "StateMachine","Transform",
}

function StateMachineSystem:Start()
   local iScene = self:GetCurScene();
   for _,tbLayer in pairs(iScene:GetRenderList()) do
      for _,iActor in ipairs(tbLayer) do 
         repeat
            if not self:GetRegisterCompo(iActor) then break end
            local iCompoStateMachine = iActor:GetiCompo("StateMachine");
            iActor:SetiCompo("StateMachine","sCurrentState",iCompoStateMachine.sCurrentState);
            self:Execute( iActor , iCompoStateMachine.sCurrentState);
         until true
      end
   end
end
 
function StateMachineSystem:Update(dt)
	local iScene = self:GetCurScene();
	for _,tbLayer in pairs(iScene:GetRenderList()) do
		for _,iActor in ipairs(tbLayer) do 
			repeat
				if not self:GetRegisterCompo(iActor) then break end
				if not iActor.bVisible then break end
                iActor:UpdateState(dt);
			until true
		end
	end 
end

function StateMachineSystem:Execute(iActor,sState)
    if iActor[sState] then 
        iActor[sState](iActor);
    end 
end

function StateMachineSystem:Render()
    local iScene = self:GetCurScene();
    for _,tbLayer in pairs(iScene:GetRenderList()) do
       for _,iActor in ipairs(tbLayer) do 
          repeat
             if not self:GetRegisterCompo(iActor) then break end
             if not iActor.bVisible then break end
             local iCompoTransform = iActor:GetiCompo("Transform");
             local iCompoStateMachine = iActor:GetiCompo("StateMachine"); 
             local iCompoColor = iActor:GetiCompo("Color");
             local x = iCompoTransform.x;
             local y = iCompoTransform.y - 20;
             local w = iCompoTransform.w;
             local h = iCompoTransform.h; 
             love.graphics.setColor(1,1,1,1);
             love.graphics.print(iCompoStateMachine.sCurrentState,x,y);
          until true
       end
    end 
 end