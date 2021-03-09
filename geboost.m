function [ X ]= geboost( A,B )
% epilisi AX=B me tonwsi wste na min exw
% odigo mikrotero apo 1e-2.

[n,n]=size(A); [n,m]=size(B);
[L,U]=luboost(A,1e-2);
                            %for i=1:m
X(:,1:m)=U\(L\B(:,1:m));  %Y(:,i)=forward(L,B(:,i));
                           %X(:,i)=backsubs(U,Y(:,i));
                            %end
end

