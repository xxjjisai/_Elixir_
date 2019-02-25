_G.TheOridinaryWorld = GameChainSystem:DeriveClass("TheOridinaryWorld");

function TheOridinaryWorld:StartHandler()

    UIMgr:CreateUI("ShapeButton",{sName="一个按钮",x=50,y=50,w=90,h=50})

end 

function TheOridinaryWorld:DestoryHandler()
    Camera.scale = 1;
end