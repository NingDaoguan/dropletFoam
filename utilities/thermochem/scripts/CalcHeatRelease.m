function Sh = CalcHeatRelease(rxn,T,thermo)

    dH = zeros(size(T));

    Nr = length(rxn.reactants);
    Np = length(rxn.products);
    
    for r = 1:Nr
        dH = dH + H(thermo.(rxn.reactants(r).name),T)*rxn.reactants(r).e;
    end
    
    for p = 1:Np
        dH = dH - H(thermo.(rxn.products(p).name),T)*rxn.products(p).e;
    end
    
    Sh = dH; %J/mol * mol/cm3/s = W/cm3