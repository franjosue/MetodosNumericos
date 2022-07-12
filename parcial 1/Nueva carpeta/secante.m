%secante
clc,clear;
x0=0;
x1=1;
t = -5:0.1:10;
f=@(t) (t.^3-7*t.^2+14*t-6);

plot(t,f(t));
grid on;


tol=0.0001;
err=1;
iter=1;
format short;
while err>tol
    
    x2=x1-(((x1-x0)/(f(x1)-f(x0)))*f(x1));

    err=abs(x1-x2);
    
%     fprintf('iter = '), disp(iter);
%     fprintf('x2 = '), disp(x2);
%     fprintf('err = '), disp(err);
   
    x0=x1;
    x1=x2;
    iter =iter+1;

end

    fprintf('iter = '), disp(iter);
    fprintf('x2 = '), disp(x2);
    fprintf('err = '), disp(err);
    

