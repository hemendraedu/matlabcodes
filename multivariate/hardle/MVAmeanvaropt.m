% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAmeanvaropt
% ---------------------------------------------------------------------
% Description:  MVAmeanvaropt simulates 10 random portfolios and 
%               displays their mean return versus volatility.
%               For each of these random portfolios we calculate also
%               portfolio with the same mean return and smaller 
%               volatility.          
% ---------------------------------------------------------------------
% Usage:        MVAmeanvaropt
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Simulates 10 random portfolios and displays their mean
%               return versus volatility.
%               For each of these random portfolios we calculate also
%               portfolio with the same mean return and smaller 
%               volatility.
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Song Song
% ---------------------------------------------------------------------

x1=load('ibm.dat');
x2=load('panam.dat');
x3=load('delta.dat');
x4=load('coned.dat');
x5=load('gerber.dat');
x6=load('texaco.dat');

x=[x1,x2,x3,x4,x5,x6];

mu=mean(x);
one(1:6,1)=1;
sigma=cov(x);

c=unifrnd(0,1:6);
c=c/sum(c);
plt=[0.5*(c*cov(x)*c'),(c*mu')];
s=inv(sigma);

l1=2*(c*mu'-(mu*s*one)/(one'*s*one))/(mu*s*mu'-(one'*s*mu'*mu*s*one)/(one'*s*one));
l2=(2-l1*one'*s*mu')/(one'*s*one);
copt=s*(l1*mu'+l2*one)/2;
pltopt=[0.5*(copt'*sigma*copt),(copt'*mu')];

i=1;
while i<10
    i=i+1;
    c=unifrnd(0,1:6);
    c=c/sum(c);
    plt=[plt;0.5*(c*cov(x)*c'),(c*mu')];
    s=inv(sigma);
    l1=2*(c*mu'-(mu*s*one)/(one'*s*one))/(mu*s*mu'-(one'*s*mu'*mu*s*one)/(one'*s*one));
    l2=(2-l1*one'*s*mu')/(one'*s*one);
    copt=s*(l1*mu'+l2*one)/2;
    pltopt=[pltopt;0.5*(copt'*sigma*copt),(copt'*mu')];
end

hold on
xlim([0 0.002]);
ylim([0 0.02]);
scatter(plt(:,1),plt(:,2),'b','.');
scatter(pltopt(:,1),pltopt(:,2),'r','s');
hold off
