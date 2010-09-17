% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAmeanvar
% ---------------------------------------------------------------------
% Description:  MVAmeanvar simulates many random portfolios and 
%               displays their mean return versus volatility.          
% ---------------------------------------------------------------------
% Usage:        MVAmeanvar
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Simulates many random portfolios and displays their 
%               mean return versus volatility.     
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
sigma=cov(x);
c=unifrnd(0,1:6);
c=c/sum(c);
plt=[0.5*(c*cov(x)*c'),(c*mu')];

i=1;
while (i<10000)
    i=i+1;
    c=unifrnd(0,1:6);
    c=c/sum(c);
    plt=[plt;0.5*(c*cov(x)*c'),(c*mu')];
end

hold on
xlim([0 0.004]);
ylim([0 0.025]);
scatter(plt(:,1),plt(:,2),'b','.');
hold off                
  


 


