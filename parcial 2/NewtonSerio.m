clear all
clc
syms x y z
n=input('numero de ecuaciones (n): ');
F=input('introducir matriz F (matriz de las funciones fi): ');
x0=input('introducir matriz x0 (aproximaciones iniciales de xi): ');
m=input('numero maximo de iteraciones: ');
E=input('Error permitido: ');

k=1;
Fprima = jacobian(F);
f = inline(F);
jf = inline(Fprima);
while k <= m
    fo = f(x0(1),x0(2));
    jfo = jf(x0(1),x0(2));
    x = x0 - inv(jfo)*fo;
    f1 = f(x(1),x(2));
    Norma = norm((f1),Inf);
    fprintf('%d ',k);
    fprintf('X= %3.5f \t Y=%3.5f',x(1),x(2));
    fprintf('\t Norma: %3.5f\n',Norma);
    if Norma  < E
        break
    end
    k = k+1;
    x0 = x;
end
fprintf('Solucion \n');


%[4*x^2-20*x+0.25*y^2+8;0.5*x*y^2+2*x-5*y+8];
%[4*x.^2-20.*x+0.25.*y.^2+8;0.5.*x.*y.^2+2.*x-5.*y+8];