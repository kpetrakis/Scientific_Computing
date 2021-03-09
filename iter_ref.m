function [ x ] = iter_ref( A,W,H,b )
%Iteration refinment method
%   xrisimopoiw LU paragontopoiisi gia to A+E gia na epanaxrisimopoiisw
%   tous paragontes L kai U ston vroxo gia fthinotero ipologismos tou z
%   gia na min xreiastei na antistrepsw to A.
k=0;
E=W*H';
[n,n]=size(A+E);
x=ones(n,1); %arxiki ektimisi gia x
[L,U]=gep((A+E),'');
r=b-(A+E)*x;
error=1e-6;
while norm(r)>(1/norm(inv(A+E)))*error %thelw ||z||<1e-16 ara ||r|<(1/||inv(A+E)||)*1e-6
    r=b-(A+E)*x; 
    z=U\(L\r);    %anti gia z=(A+E)\r; xrisimopoiw tous paragontes L kai U gia e3ikonomisi praxewn
    x=x+z;
    k=k+1;
    if k>50
        error('Astoxia eparkous sigklisis meta apo 50 epanalipseis');
        break;
    end
end 
disp(k);
    

end

