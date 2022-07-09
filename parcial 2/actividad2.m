%DATOS 
%A=[2.01475 -0.02875 0 0; 
%    -0.02875 2.01475 -0.02875 0; 
 %   0 -0.02875 2.01475 -0.02875; 
  %  0 0 -0.0285 2.01475];%matriz cuadrada
b=[4 0 0 ];%vector
A=[2 3 -1; 1 -2 1;2 -12 5];

%~~~~~~~~~~~~~~~~~~~~~condición especial de la matriz~~~~~~~~~~~~~~~~~~~~%
fprintf('Condicion especial de la matriz\n');
n=3;
m=3;
i=1;
j=1;
g=0;
con=0;
con1=1;
for i=1:n
    p=abs(A(i,i));
    for j=1:m
        if j ~= i
            g=g+abs(A(i,j));
        end
    end
    
    if p >= g
        con=1;
    else
        con1=0;
    end
end
fprintf('\n');
if con == 1 & con1 == 1
    fprintf("La matriz es diagonal dominante");
else
    fprintf("La matriz no es diagonal dominante");
end
fprintf('\n');

try chol(A);
    disp('la matriz es simetrica positiva definida')
catch ME
    disp('la matriz no es simetrica positiva definida')
end
fprintf('\n');
i=1;
k=0;
j=2;
if A(1,2)~=0
    while A(1,j)~=0 & j<=n
        k=k+1;
        j=j+1;
    end
end
HBW=k;
BW=2*HBW+1;
if k~=0
    fprintf('El ancho de la banda media de la matriz es de %d \n',HBW)
    fprintf('El ancho de la banda de la matriz es de %d \n',BW)
else
    fprintf('El ancho de la banda media de la matriz es de %d \n',HBW)
    fprintf('El ancho de la banda de la matriz es de %d \n',BW)
end
  
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~radio espectral~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
fprintf('\nConvergencia de las matrices de iteracion\n');
D=diag(diag(A));
AL=tril(A,-1);
AU=triu(A,1);

%---Matriz de iteracion de Jacobi---%
MJ=D^-1*(AL+AU);
r_J = max(abs(eig(MJ)));

if(r_J<1)
    fprintf("\nEl radio espectral de la matriz iterativa de Jacobi es %d y converge a la solución única\n", r_J);
else
    fprintf("\nEl radio espectral de la matriz iterativa de Jacobi es %d y no converge a la solución única\n", r_J);
end

%---Matriz de iteracion de Gauss-Seidel---%
MGS=-(D+AL)^-1*AU;

r_GS = max(abs(eig(MGS)));

if(r_GS<1)
    fprintf("\nEl radio espectral de la matriz iterativa de Gauss-Seidel es %d y converge a la solución única\n", r_GS);
else
    fprintf("\nEl radio espectral de la matriz iterativa de Gauss-Seidel es %d y no converge a la solución única\n", r_GS);
end

%---Matriz de iteracion SOR---%
w = 1.1;
MS=(D-w*AL)^-1*((1-w)*D+w*AU);  

r_S = max(abs(eig(MS)));

if(r_S<1)
    fprintf("\nEl radio espectral de la matriz iterativa SOR es %d y converge a la solución única\n", r_S);
else
    fprintf("\nEl radio espectral de la matriz iterativa SOR es %d y no converge a la solución única\n", r_S);
end

%~~~~~~~~~~~~~~~~~~~~~~~~método interactivo SOR~~~~~~~~~~~~~~~~~~~~~~~%
fprintf('\nMetodo iterativo de SOR\n');
format long;

 n = 4;
 A = zeros(n,n+1);
 x1 = zeros(1,n);
 
 A=[2.01475 -0.02875 0 0 4.175; 
    -0.02875 2.01475 -0.02875 0 0; 
    0 -0.02875 2.01475 -0.02875 0; 
    0 0 -0.0285 2.01475 2.0875];
 x1 = [0 0 0 0]; %vector inicial

 tol = 0.001;
 m = 4;


 
 k = 1;
 fprintf('\n');
 while  k <= m 
   err = 0;
   if k ==1
       fprintf('La solucion del vector luego de %d interacciones es :\n', k-1);
     for i = 1 : n
         fprintf('   %11.8f \n', x1(i));
     end
   end
   for i = 1 : n 
      s = 0;
      for j = 1 : n 
        s = s-A(i,j)*x1(j);
      end
      s = w*(s+A(i,n+1))/A(i,i);
      if abs(s) > err 
         err = abs(s);
      end
      x1(i) = x1(i)+s;
   end
   
   if err <= tol  
      break;
   else
      k = k+1;
   end
   fprintf('\n');
   fprintf('La solucion del vector luego de %d interacciones es :\n', k-1);
     for i = 1 : n
         fprintf('   %11.8f \n', x1(i));
     end
 end


