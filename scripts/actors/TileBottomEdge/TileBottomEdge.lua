local TileBottomEdge = {};
function TileBottomEdge:Create(sClassName)
   local obj = Actor:DeriveClass(sClassName);
   return obj;
end
return TileBottomEdge;
