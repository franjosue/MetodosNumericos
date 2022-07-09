%function x = gaussSeidel(M, b, n, tol, N)
%   M = Matriz que contiene el Sistema de Ecuaciones
%   b = Vector Columna que contiene los resultados de cada ecuación
%   n = Número de ecuaciones e incógnitas
%   tol = tolerancia permitida
%   N = Número máx. de iteraciones

function x = gaussSeidel(A, b, x0, tol, itmax, w)
%   A = Matriz que contiene el Sistema de Ecuaciones
%   b = Vector Columna de los términos independientes
%   xo = vector de aproximación inicial
%   tol = tolerancia permitida
%   itmax = Número máx. de iteraciones

x = x0;
it = 0;
n = length(x0);

for k=1:itmax %Paso 1: inicializar el proceso en k=1, ..., n
    
    for i=1:n %Paso 2: Hacer i=1, ..., n
        
        %Paso 3: Calcular:
        w_m = (1-w)*x(i)

        sum1 = 0;
        for j=1:i-1
            sum1 = sum1 + (A(i,j)*x(j));
        end
        
        sum2 = 0;
        for j=i+1:n
            sum2 = sum2 + (A(i,j)*x0(j));
        end

        x(i) = w_m + ((b(i) - sum1 - sum2) * (w/A(i,i))); %Paso 3
    end
   
    
    %Paso 4: Se calcula la norma infinita
    if( norm(x - x0, inf) < tol ) %Si < tol -> paso 6
        it = k;
        break; %Paso 6
    end
    it = k; %Paso 5
    x0 = x;
end

if(it == itmax)
    disp('Se excedió el máximo número de iteraciones.');
else
    fprintf('En %i iteraciones se llegó a las aproximaciones: ', it);
    x
end

end