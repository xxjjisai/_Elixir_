_G.TheOridinaryWorld = GameChainSystem:DeriveClass("TheOridinaryWorld");

function TheOridinaryWorld:StartHandler()
    self:Init(function ()
        self:Process_1();
    end)
end

function TheOridinaryWorld:Init(pfn) 
    Camera.scale = 1;
    if pfn then pfn() end
end

function TheOridinaryWorld:Process_1()
    -- 当前场景
    local iScene = self:GetCurScene();
    -- 当前玩家
    local iPlayer = iScene:GetPlayer();
    -- 当前系统
    
    -- 创建链条 
    self:CreateChain(3,function(pfn)
        Option.bCamera_FollowPlayer = false;
        Tween(2,Camera,
            { scale = 2 },'linear',function () 
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

function TheOridinaryWorld:DestoryHandler()
    Camera.scale = 1;
end