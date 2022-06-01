function  y = design_1dof (xS,~) 

% assign the values using the options below 
    om_r    = xS(1);   % om/omn  ratio
    zeta    = xS(2);   % damping ratio


    H = 1./(1 - om_r^2 + 1i*2*zeta*om_r);

    y = abs(H); 