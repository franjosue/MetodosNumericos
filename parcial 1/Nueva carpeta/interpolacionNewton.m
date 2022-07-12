%Interpolacion de Newton
function[yi,p,b]= interpolacionNewton(x,y,xi)
%        eval,def,dif
%inicia las variables
n=length(x);
b=zeros(n);
b(:,1)=y(:);
for j=2:n
    for i=1:n-j+1
        b(i,j)=(b(i+1,j-1)-(b(i,j-1)))/(x(i+j-1)-x(i));
    end
end
%datos interpolados
xt=1;
yi=b(1,1);
for j=1:n-1
    xt=xt.*(xi-x(j));
    yi=yi+b(1,j+i)*xt;
end
%polinomio
p=num2str(b(1,1));
xx=x*-1;
for j=2:n
    signo='';
    if b(i,j)>=0
        signo2='';
    end
    xt='';
    for i=1:j-1
        if xx(i)>=0
            signo2='+';
        end
        xt=strcat(xt,'*(x',signo2,num2str(xx(i)),')');
    end
    p=strcat(p,signo,num2str(b(1,j)),xt);
end