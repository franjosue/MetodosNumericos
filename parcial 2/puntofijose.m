function Y = puntofijose(G,P,delta,max1)
  disp([' Iteracion     X1          X2          X3'])
  
  for k=1:max1
    X=G(P);
    err = abs(norm(X-P));
    P = X;
    disp([k     X'])
    if (err<delta)
      break;
    end 
  end 
  Y=X;
end 

%G = @(x) [ (2*cos(x(2)*x(3))+1)/6; (sqrt(x(1)^2+sin(x(3))+1.06))/9-0.1; -(3*exp(-x(1)*x(2))+10*pi-3)/60];
%F = syms ((2*cos(x(2)*x(3))+1)/6; (sqrt(x(1)^2+sin(x(3))+1.06))/9-0.1; -(3*exp(-x(1)*x(2))+10*pi-3)/60);
