%% Function Name: f_zeta2mor
%
% Assumptions: K. Ogata equation (5-21)
%
% Inputs:
%   zeta: Damping ratio (?)
%
% Outputs:
%   mor: Overshoot ratio (ie: Overshoot = 10% => mor = 0.1)
%
%
% $Date: 20170626
%%


function mor = f_zeta2mor(zeta)
    mor = exp((-zeta*pi/(sqrt(1-zeta^2))));
end