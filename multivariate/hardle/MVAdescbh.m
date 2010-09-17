% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAdescbh
% ---------------------------------------------------------------------
% Description:  MVAdescbh calculates descriptive statistics for the 
%               Boston housing data and their transformations. 
% ---------------------------------------------------------------------
% Usage:        MVAdescbh
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Descriptive statistics for the Boston housing data and 
%               their transformations. 
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Jorge Patron,
%               Song Song
% ---------------------------------------------------------------------

x=load('bostonh.dat');
xt=x;

xt(:,1)=log(x(:,1));
xt(:,2)=x(:,2)/10;
xt(:,3)=log(x(:,3));
xt(:,5)=log(x(:,5));
xt(:,6)=log(x(:,6));
xt(:,7)=(power(x(:,7),2.5))/10000;
xt(:,8)=log(x(:,8));
xt(:,9)=log(x(:,9));
xt(:,10)=log(x(:,10));
xt(:,11)=exp(0.4*x(:,11))/1000;
xt(:,12)=x(:,12)/100;
xt(:,13)=sqrt(x(:,13));
xt(:,14)=log(x(:,14));

m=mean(x);
med=median(x);
v=var(x);
sq=sqrt(var(x));

for i=1:14 
      tablex(i,1)=m(i);
      tablex(i,2)=med(i);
      tablex(i,3)=v(i);
      tablex(i,4)=sq(i);
end

disp('Table with Mean, Median, Variance, Sqrt(Variance) for Original Data');
tablex
disp('Covariance Matrix Original Data')
cov(x)
disp('Correlation Matrix Original Data')
corr(x)



mt=mean(xt);
medt=median(xt);
vt=var(xt);
sqt=sqrt(var(xt));

for i=1:14 
      tablext(i,1)=mt(i);
      tablext(i,2)=medt(i);
      tablext(i,3)=vt(i);
      tablext(i,4)=sqt(i);
end

disp('Table with Mean, Median, Variance, Sqrt(Variance) for Transformed Data');
tablext
disp('Covariance Matrix Transformed Data')
cov(xt)
disp('Correlation Matrix Transformed Data')
corr(xt)

