clc,clear
n=input('¿De cuantas ecuaciones tiene el sistema?: ');
m=zeros(n,n);y=zeros(n,1); x=y;
disp('Lectura de la matriz de coeficientes. ')
for i=1:n
    for j=1:n
        fprintf('Ingresa un valor para la matriz M(%d,%d):',i,j)
        m(i,j)=input('');
    end 
end
disp('Vector columna Y')
for i=1:n
    fprintf('Ingrese un valor para Y(%d)',i)
    y(i)=input('');
end
a=[m,y];
for j=1:n-1
    for i=j+1:n
        a(i,:)=a(i,:)+a(j,:)*(-a(i,j)/a(j,j));
    end
end
for i=n:-1:1
    x(i)=a(i,n+1);
    for j=i+1:n
        x(i)= x(i)- x(j)*a(i,j);
    end
    x(i)=x(i)/a(i,i);
end
disp('Se ha encontrado el valor de las incognitas:')
x
