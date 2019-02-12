
-- 切换动画
-- if key == "1" then 
--     local iAnimateSys = self.tbCurScene:GetSystemByName("AnimationSystem");
--     self.iPlayer:ChangeiCompoParam({
--         ["Animate"] = { sImg = "ball", nQuadW = 32, nQuadH = 32, nTotalFrame= 5, nLoop = 1, nTotalPlayCount = 10,nTimeAfterPlay = 0.07 };
--     })
--     iAnimateSys:ReSetFrame(self.iPlayer);
--     iAnimateSys:Play(self.iPlayer);
-- end 
-- if key == "2" then 
--     local iAnimateSys = self.tbCurScene:GetSystemByName("AnimationSystem");
--     self.iPlayer:ChangeiCompoParam({
--         ["Animate"] = { sImg = "tc", nQuadW = 30, nQuadH = 55, nTotalFrame= 18, nLoop = 1, nTotalPlayCount = 10,nTimeAfterPlay = 0.07 };
--     })
--     iAnimateSys:ReSetFrame(self.iPlayer);
--     iAnimateSys:Play(self.iPlayer);
-- end

-- 游戏链系统
-- self:CreateChain("Chain1",4,function (pfn) 
--     if pfn then pfn() end
-- end,function (pfn)
--     if pfn then pfn() end
-- end);

-- self:ExecuteChain(true,function ()
--     self:Trace(1,"Chain System complete!")
    -- self:NextProcess(function()
    --     self:Process_2();
    -- end);
-- end);

-- 缓动用法 -- https://github.com/kikito/tween.lua
-- local iScene = self:GetCurScene();
-- local iAnimateSys = iScene:GetSystemByName("AnimationSystem");
-- local iPlayer = iScene:GetPlayer(1);
-- local w = iPlayer:GetiCompo("Size").w;
-- local h = iPlayer:GetiCompo("Size").h;
-- iPlayer:ChangeiCompoParam({
--     ["Position"] = { x = (graphicsWidth/2) - (w/2), y = graphicsHeight + 90 };
-- })
-- Tween(2,iPlayer:GetiCompo("Position"),{ x = (graphicsWidth/2) - (w/2),y = graphicsHeight - h - 90},'inOutBack',function ()
--     if pfn then pfn() end
-- end)

-- 创建Actor
-- local iScene = self:GetCurScene();
-- local iActor = ActorMgr:CreateActor("Actor")
-- iScene:AddActor(iActor);
-- iActor:ChangeiCompoParam({
--     ["Position"] = { x = (graphicsWidth/2) - (w/2), y = 0 - 120 };
-- })

-- 操作摄像头
-- Option.bCamera_FollowPlayer = false -- 先停止摄像机跟随
-- Tween(2,Camera,
--     { target_x = 200,scale = 2 },'linear',function () 
--     if pfn then pfn() end
-- end)

-- 角度转弧度
-- math.rad(360 * 15)