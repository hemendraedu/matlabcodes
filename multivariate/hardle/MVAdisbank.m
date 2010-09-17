% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAdisbank
% ---------------------------------------------------------------------
% Description:  MVAdisbank performs a ML discrimination analysis on a 
%               subsample of the Swiss bank notes ("bank2.dat") and 
%               computes the missclassification rates for the whole 
%               dataset. 
% ---------------------------------------------------------------------
% Usage:        MVAdisbank
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       ML discrimination analysis on a subsample of the Swiss 
%               bank notes ("bank2.dat") and missclassification rates 
%               for the whole dataset.  
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Jorge Patron,
%               Song Song
% ---------------------------------------------------------------------

x=load('bank2.dat');

i1=[3,32,37,50,67,89,98];
i2=[108,114,116,135,145,146,148,165,168,171,173,193,194];

x1=x(i1,:);
x2=x(i2,:);

n1=length(x1);
n2=length(x2);

s1=cov(x1);
s2=cov(x2);
s=(s1*n1+s2*n2)/(n1+n2-2);

m1=mean(x1);
m2=mean(x2);
m=(m1*n1+m2*n2)/(n1+n2);

maux=m1-m2;

alpha=inv(s)*maux';
alpha

xg=x(1:100,:);
xf =x(101:200,:);

for i=1:100
    xaux(i,:)=xg(i,:)-m;
end

xgtest=xaux*alpha;
xgtest

sum=0;

%Number of missclassified
for i=1:100
    if xgtest(i)<0
        sum=sum+1;
    end
end


for i=1:100
    xaux2(i,:)=xf(i,:)-m;
end

xftest=xaux2*alpha;
xftest

sum2=0;

%Number of missclassified
for i=1:100
    if xftest(i)>0
        sum2=sum2+1;
    end
end
m=m';

m
alpha
sum
sum2
