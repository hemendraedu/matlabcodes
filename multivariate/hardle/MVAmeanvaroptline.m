% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAmeanvaroptline
% ---------------------------------------------------------------------
% Description:  MVAmeanvaroptline calculates and plots mean-variance 
%                efficient portfolios on a grid of mean returns.               
% ---------------------------------------------------------------------
% Usage:        MVAmeanvaroptline
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Calculates and plots mean-variance efficient portfolios 
%               on a grid of mean returns.    
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

l1=2*(0.02-(mu*s*one)/(one'*s*one))/(mu*s*mu'-(one'*s*mu'*mu*s*one)/(one'*s*one));
l2=(2-l1*one'*s*mu')/(one'*s*one);
copt=s*(l1*mu'+l2*one)/2;
pltopt=[0.5*(copt'*sigma*copt),(copt'*mu')];
ret=0.002;  

while ret<0.025
    ret=ret+0.002;
    s=inv(sigma);
    l1=2*(ret-(mu*s*one)/(one'*s*one))/(mu*s*mu'-(one'*s*mu'*mu*s*one)/(one'*s*one)) ;
    l2=(2-l1*one'*s*mu')/(one'*s*one);
    copt=s*(l1*mu'+l2*one)/2;
    pltopt=[pltopt;0.5*(copt'*sigma*copt),(copt'*mu')];
end

xlim([0 0.004]);
ylim([0 0.03]);
scatter(pltopt(:,1),pltopt(:,2),'r','s');




