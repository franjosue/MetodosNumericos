function I=simpson(fun, a, b, n)
% Programa que ejecuta la integración numérica por regla de Simpson
% simple y compuesta.
% fun = función a evaluar como cadena de caracteres
% a y b son los limites de integración, n número de integraciones
hold on;
h=(b-a)/n;
x=a+(0:n)*h;
f=eval(fun);
n=length(f)-1;
if (n==1)
fprintf('Los datos tienen un sólo intervalo');
elseif (n==2)
I=h/3*(f(1)+4*f(2)+f(3));
elseif (n==3)
I=3/8*h*(f(1)+3*f(2)+3*f(3)+f(4));
end
I=0;
if(2*floor(n/2)~=n)
I=3/8*h*(f(n-2)+3*f(n-1)+3*f(n)+f(n+1));
m=n-3;
else
m=n;
end
I=I+(h/3)*(f(1)+4*sum(f(2:2:m))+f(m+1));
if(m>2)
I=I+(h/3)*2*sum(f(3:2:m));
end
plot(x, f, 'g')
grid;
plot(x,zeros(size(x)),'b')
grid;
for(i=1:n);
plot([x(i), x(i)], [0, f(i)])
grid;
end
h2=(b-a)/100;
x=a+(0:100)*h2;
f=eval(fun);
plot(x, f, 'r')
grid;
title('Regla de Simpson extendida');
xlabel('x');
ylabel('f(x)');