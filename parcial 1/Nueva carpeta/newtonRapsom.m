%Datos del ejercicio que deben suministrar al programa

% Ala superior 
% 
% funcion original
% 0.3075*sqrt(x)-0.1620*x-0.2900*x.^2+0.1943*x.^3-0.0810*x.^4-0.3*x.^2+0.6*x 
% funcion derivada
% (0.1537/sqrt(x))-0.1620-0.5800*x+0.5829*x.^2-0.3240*x.^3-0.6*x+0.6
% 
% punto de partida 1
% 
% tolerancia 0.001

% Ala inferior
%
% funcion original
% -(0.3075*sqrt(x)-0.1620*x-0.2900*x.^2+0.1943*x.^3-0.0810*x.^4-0.3*x.^2+0.6*x)
% funcion derivada
% -((0.1537/sqrt(x))-0.1620-0.5800*x+0.5829*x.^2-0.3240*x.^3-0.6*x+0.6)
%
% punto de partida 0
%
% tolerancia 0.001



%Limpiamos la pantalla y mostramos el nombre del m�todo
clear
clc
disp('Metodo de Newton Raphson')

%Introducimos la funci�n,la derivada, el punto de inicio,as� como
%porcentaje de error
f=input('Introduzca la funcion f(x):','s');
d=input('Introduzca la derivada de la funcion dy/dx:','s');
pi=input('Introduzca el punto de inicio:');
err=input('Porcentaje de error:');

%cambiamos las expresiones ingresadas de string a funciones
d=inline(d);
f=inline(f);

ea=100;
j=0;
while ea>err
 %Aproximamos la raiz con la f�rmula correpondiente
 xi=pi-(f(pi)/d(pi));
 %Calculamos el porcentaje de error
 ea=abs(((xi-pi)/xi)*100);
 pi=xi;
 j=j+1;
end
%Mostramos los resultados en pantalla (con 3 decimales)
fprintf('\nRaiz= %10.3f en %d Iteraciones',pi,j)