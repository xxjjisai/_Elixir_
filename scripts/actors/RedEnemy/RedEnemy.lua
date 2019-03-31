local RedEnemy = {};
function RedEnemy:Create(sClassName)
   local obj = Enemy:DeriveClass(sClassName);
   return obj;
end
return RedEnemy;
