_G.LayerSortSystem = System:DeriveClass("LayerSortSystem");

LayerSortSystem:SetRegisterCompo{
   "RenderLayer","Transform"
}

function LayerSortSystem:Update(dt)
    local iScene = self:GetCurScene();
    for nLayer,tbLayer in pairs(iScene:GetRenderList()) do
        if nLayer == RenderLayerType.nPlayer then 
            table.sort(tbLayer, function(a,b)
                if a ~= nil and b ~= nil then 
                    return a:GetiCompo("Transform").y + a:GetiCompo("Transform").h < b:GetiCompo("Transform").y + b:GetiCompo("Transform").h
                end
            end)
        end
    end 
end