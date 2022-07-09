%{
                     ASIGNACI�N 1:
M�TODOS N�MERICOS 
Profesora:
Blanca Guill�n

>>>>>>>>>>>>>>>  G R U P O    5 <<<<<<<<<<<<<<<<<<
                  Integrantes:
Pedro Nicanor Torres Orosco       C.I 24.356.897
Tiziana Amicarella Girardi        C.I 26.290.998
Emmanuel Zambrano Mora            C.I 25.166.593
Mario Josue Grieco Villamizar     C.I 26.205.981


Ejercicio #4
 
Un Kilogramo mol de CO est� contenido en un recipiente a una temperatura
 T=215K(Kelvin) y una presi�n p=70bar.
a)Use el M�todo de Newron, con una tolerancia de 0.00001, para aproximar el
volumen del gas utilizando la ecuaci�n de Van Der Waals para un gas no
ideal, dada por:

         [p+a/v^2](v-b)= RT

Donde R=0.08314(bar*m^3)/(Kg*Mol*K), a=1.463(bar*m^6)/(Kg*mol)^2 y b=0.0394(m^3/Kg*mol)
 
b)Determine el volumen especifico v(m^3/Kg*mol) y compare el resultado con
el volumen calculado por la ecuaci�n de gases ideales, PV=RT

Desarrollo de formulas:

Funci�n(Fun):

F(v)= 70*x^3-(20.6245)*x^2+(1.463)*x-0.0576422

Volumen Inicial (x0):
x0=RT/P
x0=(0.08314)*(215)/70
x0=0.25535  "Volumen Inicial (Aproximaci�n inicial)"

Tolerancia dada por el problema (tol):

tol=0.00001

Ejecutar desde el Command Window:
newton('70*x^3-(20.6245)*x^2+(1.463)*x-0.0576422',0.25535,0.00001)
%}

function y=newton(fun,x0,tol) %Metodo de Newton-Rapson
syms x
f=inline(fun)
dfun=diff(fun,x) %C�lculo de la derivada de la funci�n ingresada
df=inline(dfun);
fprintf(' \t Tabla de Iteraciones\n');
fprintf(' \t n \t vi  \t error \n'); %Impresi�n de la primera linea de la tabla
n=1; %Inicializaci�n de la primera iteraci�n
error=10000;%Valor inicial
while error>=tol %Comienzo del Ciclo
a=x0-f(x0)/df(x0);%Proceso como trabaja las iteraciones (Aproximacion del volumen)
error =abs(a-x0);%Error absoluto y almacenamiento de nuevos datos 
fprintf('\t%i\t%3.5f\t%3.9f\n', n , a , error); %Impresi�n de cada iteraci�n 
x0=a;%Almacenamiento de los c�lculos de la aproximacion del volumen 
n=n+1;%Contador de las iteraciones
end %Fin del ciclo
%MUESTRA DE RESULTADOS
fprintf('\n El Volumen aproximado a la tolerancia es de: %3.5f m^3/Kg*mol*K con un error de: %3.9f\n', a , error);
vgases=((0.08314)*(215)/70);
fprintf('\n El Volumen aproximado de la formula de gases ideales es: %3.5f m^3/Kg*mol*K\n',vgases);
