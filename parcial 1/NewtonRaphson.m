% %Limpiamos la pantalla y mostramos el nombre del m�todo
% clear
% clc
% disp('Metodo de Newton Raphson')
% 
% %Introducimos la funci�n,la derivada, el punto de inicio,as� como
% %porcentaje de error
% f=input('Introduzca la funcion f(x):','s');
% % d=input('Introduzca la derivada de la funcion dy/dx:','s');
% pi=input('Introduzca el punto de inicio:');
% err=input('Porcentaje de error:');
% 
% %Graficamos la funci�n
% ezplot(f)
% grid on
% 
% % cambiamos las expresiones ingresadas de string a funciones
% syms x;
% d=sym(f);   d=diff(d);
% f=inline(f);
% d=inline(d);
% 
% 
% ea=100;
% j=0;
% while ea>err
%  %Aproximamos la raiz con la f�rmula correpondiente
%  xi=pi-(f(pi)/d(pi));
%  %Calculamos el porcentaje de error
%  ea=abs(((xi-pi)/xi)*100);
%  pi=xi;
%  j=j+1;
% end
% %Mostramos los resultados en pantalla (con 3 decimales)
% fprintf('\nRaiz= %10.3f en %d Iteraciones',pi,j)




function NewtonRaphson (f,pi,err)
 syms x;
 d=sym(f);  
 d = diff(f);
 
ezplot(f)
grid on

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

end


