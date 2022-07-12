%%interpolacion lagrague
%recive dos vectores x y f con los coordenadas de X y Y
function p=interpolacionLagrange(x,f,a)%a para evaluar el polinomen un punto
n=length(x); %estableco eltamño del polinomio
syms t;
p=0;
plot (x,f,'*')
grid on;

for i=1:n
    L=1;
    for j=1:n
        if i~=j
            L=L*(t-x(j))/(x(i)-x(j));
        end
    end
    p = p+L*f(i)
end

p=expand(p);%colocamos el polinomio en termimos de t
% grid on;
% ezplot(p,[0,10]);
% t=a;
% p=eval(p);
