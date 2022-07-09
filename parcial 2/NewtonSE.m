function [x,it] = NewtonSE(F,x0,tol,iter)
    %se tiene que crear las incognitas con syms para poder hacer el SENL F
    %y pasarlo para la funcion NewtonSE
    n = size(F);
    n = n(1);
    sw = 0;
    it = 0;
    x = zeros(n,1);
    incog = symvar(F);
    Jacobiano = jacobian(F,incog);
    
    while(it < iter && ~sw)
    
        y = EliGauss(subs(Jacobiano,incog,x0),subs(F,incog,x0),1);
        y = double(simplify(y));
        
        x = transpose(x0) - y;
    
    
        if(max(abs(subs(F,incog,x0))) < tol )
        %if(max(abs(x - x0)) < tol )
            sw = 1;
        end
        x0 = transpose(x);
        it = it + 1;
    end
    
end