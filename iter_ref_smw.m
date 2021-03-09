function [ x ] = iter_ref_smw( A,W,H,b )
%Iteration refinement with sherman morinson woodbury
% Opou xreiazetai na antistrepsw to A xrisimopoiw ton ammeso 
% tipo twn sherman morison woodbury.
k=0;
[n,n]=size(A);
x=ones(n,1);
r=b-(A+W*H')*x;
error=1e-6;
a=1+H'*inv(A)*W;
SMW=inv(A)-1/a*inv(A)*W*H'*inv(A);%inv(A+W*H')
while norm(r)>(1/norm(SMW))*error %thelw ||z||<1e-16 ara ||r|<(1/||inv(A+E)||)*1e-6
    r=b-(A+W*H')*x;
    a=1+H'*inv(A)*W;
    SMW=inv(A)-1/a*inv(A)*W*H'*inv(A);
    z=SMW*r;
    x=x+z;
    k=k+1;
    if k>50
        error('Astoxia eparkous sigklisis meta apo 50 epanalipseis');
        break;
    end
end
disp(k);

end

