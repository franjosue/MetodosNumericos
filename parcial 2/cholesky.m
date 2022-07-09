%disp('el metodo de cholesky');

%a=[4 -1 1;-1 4.25 2.75;1 2.75 3.5];
%b=[1;2;4];

function x=cholesky(A,b)
try chol(A);
    disp('la matrix es simetrica positiva definida')
catch ME
    disp('la matrix no es simetrica positiva definida')
end

disp(A);
U=chol(A);
L=U'
chol(A)
Y=linsolve(L,b)
X=linsolve(U,Y)
