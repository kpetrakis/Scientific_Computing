function [ A ] = arrowNW( T,n )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[m,m]=size(T);
I=eye(m);
D=T+m*I;
temp_I=eye(n); %tautotiko mitrwo pou me voithaei stin dimiourgia tou diagwniou merous tou A apo ta D
%A=zeros(n*m);
A=kron(temp_I,D);
for k=1:n-1
   A(k*m+1:(k+1)*m,1:m)=T; %mitrwa T stin prwti stili katw apo to D
   A(1:m,k*m+1:(k+1)*m)=T; %mitrwa T stin prwti grammi meta apo to D
      
end



end

