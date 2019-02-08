_G.TheOridinaryWorld = GameChainSystem:DeriveClass("TheOridinaryWorld");

function TheOridinaryWorld:StartHandler()
    self:Process_1();
end

function TheOridinaryWorld:Process_1()
    -- 当前场景
    local iScene = self:GetCurScene();
    -- 当前玩家
    local iPlayer = iScene:GetPlayer();
    -- 创建链条
    self:CreateChain(1,function(pfn)
        Tween(2,Camera,
            { scale = 3 },'inOutBack',function ()
            if pfn then pfn() end
        end)
    end);
    -- 创建链条
    self:CreateChain(1,function(pfn)
        Tween(2,Camera,
            { scale = 1 },'inQuint',function ()
            if pfn then pfn() end
        end)
    end);
    -- 执行链条
    self:ExecuteChain(true,function ()
        self:NextProcess(function ()
            self:Process_1();
        end);
    end);
end