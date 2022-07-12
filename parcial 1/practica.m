 clear,clc;
% ejercicio A -------------------------------------------------
% I= [1/exp(1)];
% 
% for i=2:20;%aqui colocamos la canidad de iteraciones
%     I = [I,1-i*I(i-1)];
% end
% disp([I']);

%%ejercicio b_--------------------------------------------------
X=[0.015909];
ind=[1,2,3,4,5,6,7,8,9,10];
format long;
for i=9:-1:1;

    X=[(1/5*i)+(X(10-i)/5),X];
end

 disp([ind',X']);







