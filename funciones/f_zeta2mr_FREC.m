%% Function Name: f_zeta2mr_FREC
%
% Assumptions: ???
%
% Inputs:
%   zeta: Damping ratio (?)
%
% Outputs:
%   mr: ???
%
%
% $Date: 20170626
%%

function mr = f_zeta2mr_FREC(zeta)
    mr = 1/(2*zeta*sqrt(1-zeta^2));
end