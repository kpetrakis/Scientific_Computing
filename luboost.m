function [ L,U ] = luboost( A,t )
%LU with boosting
%   t: gia odigous me mikroteri timi apo t tha ektelesw tonwsi
%  
[m, n] = size(A);
if m~= n, error('Matrix must be square.'), end
if nargin<2, error('Not enough input arguments,dwste pinaka kai elaxisti timi odigou'),end
I=eye(m);T=eye(m); %count=0; A_arxiko=A;
for k = 1:min(m-1,n)
    if abs(A(k,k))<t
        A_inv=inv(A);   %ipologismos tou antistrofou 1 fora gia epanaxrisimopoiisi ston tipo
        a=1+I(:,k)'*A_inv*I(:,k); %a=1+v'inv(A)u~=0 apo tipo sherman-morison gia inv(A+uv')
        SMW=inv(A)-1/a*A_inv*I(:,k)*I(:,k)'*A_inv; %ipologismos tou antistrofou
        T=(I+SMW*I(:,k)*I(:,k)');               % me xrisi tipou Sherman-Morison
                                             % anti gia T=(I+inv(A)*I(:,k)*I(:,k)');
        A=A*T; %A=A+1*e*e'
        %count=count+1; o arithmos twn tonwsewn
    end
    
       i = k+1:m;
    if A(k,k) ~= 0  
       A(i,k) = A(i,k)/A(k,k);  % Multipliers.
    end

    if k+1 <= n
       % Elimination
       j = k+1:n;
       A(i,j) = A(i,j) - A(i,k) * A(k,j);
    end
 
end  
L = tril(A,-1) + eye(m,n);
U = triu(A);
U = U(1:n,:);
  %T=inv(A_arxiko)*L*U;

end

