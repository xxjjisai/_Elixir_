_G.Scene1 = GameChainSystem:DeriveClass("Scene1");

function Scene1:StartHandler() 
    local iScene = self:GetCurScene();
    local iPlayer = iScene:GetPlayer(1);
    -- SceneMgr:SetAppointScene(2);
    
    UIMgr:GetUI("btn_1"):SetAttr("onClick",function () 
        UIMgr:GetUI("input_1"):SetAttr("sText","请求中...");
        local response_body = {};
        local res, code, response_headers = http.request ({
            method = "GET",
            -- url = "http://api.m.taobao.com/rest/api3.do?api=mtop.common.getTimestamp", -- 淘宝提供 {"api":"mtop.common.getTimestamp","v":"*","ret":["SUCCESS::接口调用成功"],"data":{"t":"1552469283800"}}
            -- url = "http://quan.suning.com/getSysTime.do", -- 苏宁提供 {"sysTime2":"2019-03-13 16:10:38","sysTime1":"20190313161038"}
            url = "http://127.0.0.1:5000/login_start?sRoleName=robot1&nState=1",
            sink = ltn12.sink.table(response_body)
        })
        self:Trace(1,table.show(response_body,"response_body"))
        local tbJsonTime = response_body[1];
        -- self:Trace(1,table.show(tbJsonTime,"tbJsonTime"));
        UIMgr:GetUI("input_1"):SetAttr("sText",tbJsonTime);
    end);  
    UIMgr:GetUI("btn_2"):SetAttr("onClick",function () 
        UIMgr:GetUI("input_2"):SetAttr("sText","请求中...");
        local response_body = {};
        local res, code, response_headers = http.request ({
            method = "GET",
            -- url = "http://api.m.taobao.com/rest/api3.do?api=mtop.common.getTimestamp", -- 淘宝提供 {"api":"mtop.common.getTimestamp","v":"*","ret":["SUCCESS::接口调用成功"],"data":{"t":"1552469283800"}}
            -- url = "http://quan.suning.com/getSysTime.do", -- 苏宁提供 {"sysTime2":"2019-03-13 16:10:38","sysTime1":"20190313161038"}
            url = "http://127.0.0.1:5000/login_complete?sRoleName=robot1&nState=2",
            sink = ltn12.sink.table(response_body)
        })
        self:Trace(1,table.show(response_body,"response_body"))
        -- local tbJsonTime = json.decode(response_body[1]);
        -- self:Trace(1,table.show(tbJsonTime,"tbJsonTime"));
        local tbJsonTime = response_body[1];
        UIMgr:GetUI("input_2"):SetAttr("sText",tbJsonTime);
    end);  


end