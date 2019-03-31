_G.Enemy = Actor:DeriveClass("Enemy");

function Enemy:Hold()
    self:Trace(1,self.sClassName..":Hold")
end

function Enemy:Attack()
    self:Trace(1,self.sClassName..":Attack")
end 

function Enemy:Def()
    self:Trace(1,self.sClassName..":Def")
end 

Enemy.nNowTime = 0;
function Enemy:UpdateState(dt)
    -- self:Trace(1,socket.gettime())
    if socket.gettime() - self.nNowTime < 1 then 
        return
    end
    self.nNowTime = socket.gettime(); 
    local iCompoStateMachine = self:GetiCompo("StateMachine");
    local iCompoHate = self:GetiCompo("Hate");
    if iCompoStateMachine.sCurrentState == "Hold" then 
        for i,iHate in ipairs(iCompoHate.tbHate) do 
            if iHate:GetiCompo("StateMachine").sCurrentState == "Attack" then 
                iCompoStateMachine.sCurrentState = "Def"
            elseif iHate:GetiCompo("StateMachine").sCurrentState == "Def" then 
                iCompoStateMachine.sCurrentState = "Hold"
            elseif iHate:GetiCompo("StateMachine").sCurrentState == "Hold" then 
                local nRandom = math.random(1, 100)
                if nRandom % 7 == 0 then 
                    iCompoStateMachine.sCurrentState = "Attack"
                end
            end
        end
    elseif iCompoStateMachine.sCurrentState == "Attack" then 
        for i,iHate in ipairs(iCompoHate.tbHate) do 
            if iHate:GetiCompo("StateMachine").sCurrentState == "Attack" then 
                iCompoStateMachine.sCurrentState = "Def"
            elseif iHate:GetiCompo("StateMachine").sCurrentState == "Def" then 
                iCompoStateMachine.sCurrentState = "Hold"
            elseif iHate:GetiCompo("StateMachine").sCurrentState == "Hold" then 
                iCompoStateMachine.sCurrentState = "Attack"
            end
        end
    elseif iCompoStateMachine.sCurrentState == "Def" then 
        for i,iHate in ipairs(iCompoHate.tbHate) do 
            if iHate:GetiCompo("StateMachine").sCurrentState == "Attack" then 
                iCompoStateMachine.sCurrentState = "Def"
            elseif iHate:GetiCompo("StateMachine").sCurrentState == "Def" then 
                iCompoStateMachine.sCurrentState = "Hold"
            elseif iHate:GetiCompo("StateMachine").sCurrentState == "Hold" then 
                iCompoStateMachine.sCurrentState = "Attack"
            end
        end
    end

    -- for i,iHate in ipairs(iCompoHate.tbHate) do 
    --     if iHate:GetiCompo("StateMachine").sCurrentState == "Attack" and iCompoStateMachine.sCurrentState = "Hold" then 
            
    --     end
    -- end

    StateMachineSystem:Execute( self , iCompoStateMachine.sCurrentState);
end