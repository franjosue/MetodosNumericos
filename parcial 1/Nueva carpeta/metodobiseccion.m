clear, clc,close all
c=15;
syms L real
t = -1:0.1:2;
% f=@(t) (70*exp(-1.5*t)+25*exp(-0.075*t)-c);
f=@(t) (t+0.5+2*cos(pi*t));


plot(t,f(t))
grid on
a=1; b=2;
fa=subs(f,a);fb=subs(f,b);
Es=0.01;
n=log2((b-a)/Es);
n=ceil(n);
format short
for k=1:1:n
c=(a+b)/2;
e=abs((b-a)/2);
A(k,:)=[k a b c f(c) e];
if f(a)*f(c)<0
    b=c;
else
    a=c;
end
end
fprintf('\n       k         a         b         c       f(c)      error \n')
disp(A)
fprintf('Solución: c='), disp(c)
fprintf('f(c)='), disp(f(c))
fprintf('error'), disp(e)