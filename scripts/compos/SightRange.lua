 -- 视野范围
 local SightRange = {};

 function SightRange:New(tbParams)
    local obj = Compo:DeriveClass('SightRange');
    obj.nSightRange = tbParams.nSightRange or 0;
    return obj;
 end

 return SightRange;
