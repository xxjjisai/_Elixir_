local Edge = {};
function Edge:Create(sClassName)
   local obj = Actor:DeriveClass(sClassName);
   return obj;
end
return Edge;
