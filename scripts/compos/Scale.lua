-- 偏移量（注册点)
local Offset = {};

function Offset:New(tbParams) 
    local obj = Compo:DeriveClass("Offset");
    obj.x = tbParams.x;
    obj.y = tbParams.y;
    return obj; 
end 

return Offset;