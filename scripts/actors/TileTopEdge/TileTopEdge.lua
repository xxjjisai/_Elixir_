local TileTopEdge = {};
function TileTopEdge:Create(sClassName)
   local obj = Actor:DeriveClass(sClassName);
   return obj;
end
return TileTopEdge;
