function [ p,y ] = T_QR( n )
% sinartisi gia to meros D erwtima 1
%   i sinartisi epistrefei to dianisma p
%  diladi tous sintelestes tou poliwnimou pou ziteitai

%n=200:200:1400;
for i=1:length(n)
    A=rand(n(i));
    f=@()qr(A);
    %s=0
    %for k=1:5
     %   s=timeit(f,2)+s;  %[Q,R]=qr(A);
    %end
    %time=s/5;
    y(i)=timeit(f,2);
end
[p,s,mu]=polyfit(n,y,3);

end
