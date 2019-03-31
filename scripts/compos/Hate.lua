 -- Hate
 local Hate = {};

 function Hate:New(tbParams)
    local obj = Compo:DeriveClass('Hate');
    obj.tbHate = tbParams.tbHate;
    return obj;
 end

 return Hate;
