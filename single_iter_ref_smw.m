function [ x ] = single_iter_ref_smw( A,W,H,b )
% Omoia me iter_ref_smw me tin diafora oti twra
% kanw ton ipologismou tou tipou SMW se single precision
k=0;
[n,n]=size(A);
x=ones(n,1);
r=b-(A+W*H')*x;
error=1e-6;
a=1+single(H')*single(inv(A))*single(W);
SMW=single(inv(A))-1/single(a)*single(inv(A))*single(W)*single(H')*single(inv(A));
while norm(r)>(1/norm(SMW))*error %thelw ||z||<1e-16 ara ||r|<(1/||inv(A+E)||)*1e-6
    r=b-(A+W*H')*x;
    a=1+single(H')*single(inv(A))*single(W);
    SMW=single(inv(A))-1/single(a)*single(inv(A))*single(W)*single(H')*single(inv(A));
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

