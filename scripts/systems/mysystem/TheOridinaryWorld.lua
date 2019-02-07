_G.TheOridinaryWorld = GameChainSystem:DeriveClass("TheOridinaryWorld");

function TheOridinaryWorld:StartHandler() 
    self:Process_1(); 
end

function TheOridinaryWorld:Process_1()

    -- local iScene = self:GetCurScene();
    -- local iPlayer = iScene:GetPlayer();
    -- self:CreateChain(1,function (pfn)
    --     local r = iPlayer:GetiCompo("Size").r;
    --     local h = iPlayer:GetiCompo("Size").h;
    --     Tween(35,iPlayer:GetiCompo("Rotate"),{ r = math.rad(360) },'linear',function ()
    --         if pfn then pfn() end
    --     end)
    -- end);

    self:CreateChain(1,function()
        
    end);

    self:ExecuteChain(true,function ()
        self:NextProcess(function()
            -- self:Process_1();
        end);
    end);

end