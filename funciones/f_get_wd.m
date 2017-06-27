%% Function Name: f_get_wd
%
% Description: Obtiene la frecuencia natural amortiguada a partir de la
% frecuencia natural y el coeficiente de amortiguamiento. K. Ogata ecuacion
% (5-11)
%
% Inputs:
%   zeta: Coeficiente de amortiguamiento (?)
%   wn: Frecuencia natural
%
% Outputs:
%   wd: Frecuencia natural amortiguada
%
%
% $Date: 20170626
%%

function wd = f_get_wd(zeta,wn)
    wd = wn*sqrt(1-2*zeta^2);
end