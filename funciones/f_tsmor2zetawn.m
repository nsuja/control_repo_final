%% Function Name: f_get_wd
%
% Description: Partiendo del settling time y el overshoot obtiene la
% frecuencia natural y el factor de amortiguamiento, asumiendo criterio de
% 2% (K. Ogata ecuacion 5-22)
%
% Inputs:
%   ts: Tiempo de asentamiento (Settling time)
%   mor: Factor de sobreelongacion (Overshoot ratio) (ie: Overshoot = 10% 
% => mor = 0.1)
%
% Outputs:
%   zeta: Coeficiente de amortiguamiento (?)
%   wn: Frecuencia natural
%
%
% $Date: 20170626
%%

function [zeta,wn] = f_tsmor2zetawn(ts,mor)
    aux = 4/ts;
    zeta = f_mor2zeta(mor);
    wn = aux/zeta;
end