-- 地图
local Map = {};

function Map:New(tbParams) 
    local obj = Compo:DeriveClass("Map");
    obj.tbDataMapInfo = {};
    obj.tbRealMapInfo = {};
    obj.nCellSize = tbParams.nCellSize or 100;
    obj.nCellCount = tbParams.nCellCount or 30;
    obj.sType = tbParams.sType or "Map"; -- todo...地形类型（草地，雪地，沙漠，海洋等）
    return obj;
end 
return Map;