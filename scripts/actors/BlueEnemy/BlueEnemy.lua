local BlueEnemy = {};
function BlueEnemy:Create(sClassName)
   local obj = Enemy:DeriveClass(sClassName);
   return obj;
end
return BlueEnemy;
