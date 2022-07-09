clc;
fprintf('Ingresar los elementos de la matriz separados por espacios');
fprintf('\n y las filas por punto y coma(1 2 3 4;5 6 7 8)');
fprintf('\n Matriz :');
matriz=input('','s');
A=str2num(matriz); L=zeros(size(A)-1); U=zeros(size(A)-1); n=length(L);
for i=1:n
L(i,i)=1;
end
U(1,1)=A(1,1);
for j=2:n
L(j,1)=A(j,1)./U(1,1);
U(1,j)=A(1,j)./L(1,1);
end
for i=2:n
acum=0;
for k=1:i-1
acum=acum +(L(i,k).*U(k,i));
end
U(i,i)=A(i,i)-acum;
for j=i+1:n
acum2=0; acum3=0;
for k=1:i-1
acum2=acum2+(L(j,k).*U(k,i));
acum3=acum3+(L(i,k).*U(k,j));
end
L(j,i)=(A(j,i)-acum2)./U(i,i);
U(i,j)=(A(i,j)-acum3)./L(i,i);
end
end
z(1)=A(1,n+1)/L(1,1);
for i=2:n
sum=0;
for j=1:i-1
sum=sum+(L(i,j)*z(j));
end
z(i)=(A(i,n+1)-sum)/L(i,i);
end
x(n)=z(n)/U(n,n);
i=n-1;
while i>0
sum=0;
for j=i+1:n
sum=sum+(U(i,j)*x(j));
end
x(i)=(z(i)-sum)/U(i,i);
i=i-1;
end
disp(x);