function [ x,error ] = arrow_solve( A,b,e )
% Methodos gia tis metriseis pou apaitountai sta erwtimata
% 6 kai 7 tou merous C tis askisis
%  dexetai mitrwo A kai deutero melos b kai linei Ax=b me LU

[n,n]=size(A);
[L,U]=lu(A);
x=U\(L\b);
%x=A\b;
error=norm(e-x,Inf)/norm(e,Inf);

end

