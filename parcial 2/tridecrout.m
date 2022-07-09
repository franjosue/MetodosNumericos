function [L,U] = tridecrout(A)
  n = size(A,1);
  L = zeros(n);
  U = eye(n);
  for k=1:n
    for i=k:n
        L(i,k) = A(i,k)-L(i,1:k-1)*U(1:k-1,k);
    endfor
    for i=k+1:n
      U(k,i) = (A(k,i)-L(k,1:k-1)*U(1:k-1,i))/L(k,k);     
    endfor
  endfor