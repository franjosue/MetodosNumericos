
function x = jacobi(A, b, x0, tol, itmax)
%   A = Matriz que contiene el Sistema de Ecuaciones
%   b = Vector Columna de los términos independientes
%   xo = vector de aproximación inicial
%   tol = tolerancia permitida
%   itmax = Número máx. de iteraciones

x = x0;
it = 0;
n = length(x0);

for k=1:itmax         %Paso 1: inicializar en k=1, ..., N
    
    for i=1:n     %Paso 2: Hacer i=1, ..., n
        
        %Paso 3: Cálculo:
        sum = 0;
        for j=1:n
            if j~=i
                sum = sum + (A(i,j)*x0(j));
                
            end
        end
        x(i) = (b(i) - sum)/A(i,i);  %Paso 3
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
end


end