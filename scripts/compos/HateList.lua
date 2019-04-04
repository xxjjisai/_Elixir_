 -- HateList
 local HateList = {};

 function HateList:New(tbParams)
    local obj = Compo:DeriveClass('HateList');
    obj.tbHateType = tbParams.tbHateType or {}; -- 仇恨类型列表
    obj.tbKindType = tbParams.tbKindType or {}; -- 友好类型列表
    obj.tbActorHate = {}; -- 仇恨列表
    obj.tbActorKind = {}; -- 友好列表
    return obj;
 end

 return HateList;
