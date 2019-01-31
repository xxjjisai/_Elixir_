local RedEnemy = {};
function RedEnemy:Create(sClassName)
   local obj = Actor:DeriveClass(sClassName);
   return obj;
end
return RedEnemy;