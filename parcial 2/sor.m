function [x] = sor()
disp('==POR FAVOR,INGRESE LA MATRIZ QUE SE LE PIDA DE FORMA ORDENADA==');
n=input('CUANTAS ECUACIONES:');
A=input('INGRESE LA MATRIZ A:');
b=input('INGReSE LA MATRIZ B:');
maxiter=input('CUANTAS ITERACIONES DESEA HACER:');
x0=input('INGRESE VECTOR APROXIMACION:');
w=input('INGRESE ACELERADOR W:');
tol= 0.001;
[m n]= size(A);
if m~=n, error('Matriz del sistema no cuadrada'), end
if m~= length(b), error ('sistema no coherente'),end
x=zeros(size(b));
x2=x;
if any(abs(diag(A))<eps)
error('Metodo no valido. Elemento diagonal nulo')
end
for k=1:maxiter
for i=1:n
tem=(b(i)-sum(A(i,[1:i-1 i+1:n])*x0([1:i-1 i+1:n])'))/A(i,i);
x(i)=tem*w + (1-w)*x0(i);
x0(i)=x(i);
end
if norm(x-x2)< tol
fprintf('\n SOR CONVERGE en %d iteraciones\n',k),
return
end
x2=x;
end
fprintf('\n SOR NO CONVERGE en %d iteraciones\n',maxiter)