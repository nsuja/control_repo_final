path(path,'./funciones/')

A = [
    -4 .4;
    1 -1.1
    ];
B = [
    2 ;
    0
    ];
C = [
    1 0
    ];
D = [ 0 ];

% Algunos valores para verificaciones
[num, den] = ss2tf(A,B,C,D);
%Imprimo pretty
fprintf('Funcion transferencia obtenida por MATLAB (pueden NO coincidir\n');
tf(num,den)
raices = roots(den)

%% Verifico controlabilidad
% Obtengo matriz de controlabilidad
% Co = [B AB A^2B ...]
Co = ctrb(A,B);
% Verificar que <rango> sea igual al numero de variables de estado.
rango = rank(Co);
fprintf('Rango %d, verificar numero de variables de estado!\n', rango);

%% Ubicar polos a lazo cerrado
% Cantidad de polos LC
npolos = 2;
% Criterio de dominancia para >2 polos
criterio_dominancia=5;
% Opcion
opt=2;
fprintf('\nCalculo de polos a LC (%d) Opcion: %d\n', npolos, opt);
switch opt
    % Si me dan ts y mor
    case 1
        ts = 1;
        mor = 0.05;
        fprintf('Parto de ts %f y mor %f(%f%%)\n', ts, mor, mor*100);
         
        [zeta, wn] = f_tsmor2zetawn(ts,mor);
        zetawn = zeta*wn; %Parte real
        wd = f_get_wd(zeta,wn); %Parte imaginaria
        p = zeros(1,npolos);
        p(1,1) = -zetawn+1i*wd;
        p(1,2) = -zetawn-1i*wd;
        for i = 3 : npolos
            p(1,i) = -zetawn * 5;
        end
    % Si me dan los polos directamente
    case 2
        fprintf('Parto de polos LC hardcodeados\n');
        p(1,1) = -4;
        p(1,2) = -6;
end

fprintf('Polos LC: \n');
for i = 1 : npolos
    disp(p(1,i));
end
fprintf('\n');

polos_LC = p;
K = acker(A,B,polos_LC);
fprintf('Matriz de coeficientes de realimentacion del vector de estados: \n');
disp(K);