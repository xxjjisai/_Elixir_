local TileGrid = {};
function TileGrid:Create(sClassName)
   local obj = Actor:DeriveClass(sClassName);
   return obj;
end
return TileGrid;
