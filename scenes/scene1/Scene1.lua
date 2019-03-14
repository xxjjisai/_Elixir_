_G.Scene1 = GameChainSystem:DeriveClass("Scene1");

function Scene1:StartHandler() 
    local iScene = self:GetCurScene();
    local iPlayer = iScene:GetPlayer(1); 
    SceneMgr:SetAppointScene(2); 
    
end