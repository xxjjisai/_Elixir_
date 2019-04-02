 -- 有限状态机
 local FSM = {};

 function FSM:New(tbParams)
    local obj = Compo:DeriveClass('FSM');

     return obj;
 end

 return FSM;
