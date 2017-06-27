%% Function Name: f_mor2zeta
%
% Assumptions: None
%
% Inputs:
%   mor: Overshoot ratio (ie: Overshoot = 10% => mor = 0.1)
%
% Outputs:
%   zeta: Damping ratio (?)
%
%
% $Date: 20170626
% ________________________________________

function zeta = f_mor2zeta(mor)
    validateattributes(mor,{'double'},{'positive'})
    
    zeta = 1/(sqrt(1+(pi/log(mor))^2));
end

