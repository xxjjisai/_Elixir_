 -- 有限状态机
 local StateMachine = {};

 function StateMachine:New(tbParams)
    local obj = Compo:DeriveClass('StateMachine');
    obj.sCurrentState = tbParams.sCurrentState;
    obj.tbStates = tbParams.tbStates;
    return obj;
 end

 return StateMachine;
