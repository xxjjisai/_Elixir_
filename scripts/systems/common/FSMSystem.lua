_G.FSMSystem = System:DeriveClass("FSMSystem");

FSMSystem:SetRegisterCompo{
   "FSM","Transform",
}

function FSMSystem:Start()
   local iScene = self:GetCurScene();
   for _,tbLayer in pairs(iScene:GetRenderList()) do
      for _,iActor in ipairs(tbLayer) do 
         repeat
            if not self:GetRegisterCompo(iActor) then break end
            local iCompoFSM = iActor:GetiCompo("FSM");
            
         until true
      end
   end
end