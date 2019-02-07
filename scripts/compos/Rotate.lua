-- 旋转
local Rotate = {};

function Rotate:New(tbParams) 
    local obj = Compo:DeriveClass("Rotate");
    obj.r = tbParams.r or 0;
    return obj; 
end 

return Rotate;