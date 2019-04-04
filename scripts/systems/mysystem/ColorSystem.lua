_G.ColorSystem = System:DeriveClass("ColorSystem");

ColorSystem:SetRegisterCompo{
    "Color"
};

function ColorSystem:FixColorForR(iActor)
    iActor:SetiCompo("Color", "r", 1);
    iActor:SetiCompo("Color", "g", 0);
    iActor:SetiCompo("Color", "b", 0);
end

function ColorSystem:FixColorForG(iActor)
    iActor:SetiCompo("Color", "r", 0);
    iActor:SetiCompo("Color", "g", 1);
    iActor:SetiCompo("Color", "b", 0);
end

function ColorSystem:FixColorForB(iActor)
    iActor:SetiCompo("Color", "r", 0);
    iActor:SetiCompo("Color", "g", 0);
    iActor:SetiCompo("Color", "b", 1);
end

function ColorSystem:FixColorForWhite(iActor)
    iActor:SetiCompo("Color", "r", 1);
    iActor:SetiCompo("Color", "g", 1);
    iActor:SetiCompo("Color", "b", 1);
end

function ColorSystem:FixColorForBlack(iActor)
    iActor:SetiCompo("Color", "r", 0);
    iActor:SetiCompo("Color", "g", 0);
    iActor:SetiCompo("Color", "b", 0);
end

function ColorSystem:ChangeColor(iActor,sType)
    if not self:GetRegisterCompo(iActor) then return end
    if ColorSystem["FixColorFor"..sType] then 
        self["FixColorFor"..sType](self,iActor);
    end
end