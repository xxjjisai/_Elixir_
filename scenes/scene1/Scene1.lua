_G.Scene1 = GameChainSystem:DeriveClass("Scene1");

function Scene1:StartHandler()
    local r, c, h = http.request ({
        method = "GET",
        url = "http://127.0.0.1:5000/"
    })
    self:Trace(1,r,c,h.ncount)
    UIMgr:GetUI("btn_1"):SetAttr("sText",h.ncount)
    UIMgr:GetUI("btn_1"):SetAttr("onClick",function ()
        local r, c, h = http.request ({
            method = "GET",
            url = "http://127.0.0.1:5000/"
        })
        self:Trace(1,r,c,h.ncount)
        UIMgr:GetUI("btn_1"):SetAttr("sText",h.ncount)
    end)

end