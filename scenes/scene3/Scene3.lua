_G.Scene3 = GameChainSystem:DeriveClass("Scene3");

function Scene3:StartHandler() 
    local iScene = self:GetCurScene();
    local iPlayer = iScene:GetPlayer(1); 

    -- SceneMgr:SetAppointScene(2);
    -- iPlayer:GetiCompo("Color").a = 0;
    
    -- UIMgr:GetUI("btn_1"):SetAttr("onClick",function () 
    --     local response_body = {};
    --     local res, code, response_headers = http.request ({
    --         method = "GET",
    --         -- url = "http://api.m.taobao.com/rest/api3.do?api=mtop.common.getTimestamp", -- 淘宝提供 {"api":"mtop.common.getTimestamp","v":"*","ret":["SUCCESS::接口调用成功"],"data":{"t":"1552469283800"}}
    --         url = "http://quan.suning.com/getSysTime.do", -- 苏宁提供 {"sysTime2":"2019-03-13 16:10:38","sysTime1":"20190313161038"}
    --         -- url = "http://127.0.0.1:5000/", -- 苏宁提供 {"sysTime2":"2019-03-13 16:10:38","sysTime1":"20190313161038"}
    --         sink = ltn12.sink.table(response_body)
    --     })
    --     local tbJsonTime = json.decode(response_body[1]);
    --     self:Trace(1,table.show(tbJsonTime,"tbJsonTime"));
    --     UIMgr:GetUI("input_1"):SetAttr("sText",tbJsonTime["sysTime2"]);
    -- end);  


end