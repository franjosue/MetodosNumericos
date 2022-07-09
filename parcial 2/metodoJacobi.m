clc;
fprintf('Introduzca la matriz:\n');
matriz=input('','s');
fprintf('____________________________________________________\n');
A=str2num(matriz);
vector=input('Ingrese el vector b como vector columna:\n','s');
b=str2num(vector);
vectori=input('Ingrese el vector aprox. inicial como vector columna: \n','s');
x=str2num(vectori);
tol=input('Tolerancia :');
n=input('Número máximo de iteraciones :');
fprintf('____________________________________________________\n');
dim=size(A); y=zeros(dim(2),1); k=1; band=0; while k<=n & ~band
for i=1:dim(2)
sum=0;
for j=1:dim(2)
if j~=i
sum=sum+A(i,j)*x(j);
end
end
y(i)=(b(i)-sum)/A(i,i);
end
if norm(y-x,inf)<tol
band=1;
end
k=k+1;
x=y;
end
if band==1
fprintf('Vector solución : \n');
disp(y);
fprintf('Total iteraciones:%d \n',k);
else
fprintf('No se pudo hallar solución en %d iteraciones...\n',n);
end