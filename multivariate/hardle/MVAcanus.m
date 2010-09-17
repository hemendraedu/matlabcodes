% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAcanus
% ---------------------------------------------------------------------
% Description:  MVAcanus performs a canonical correlation analysis 
%               for the US health and US crime data.
% ---------------------------------------------------------------------
% Usage:        MVAcanus
%----------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Canonical correlation analysis for the US health and US
%               crime data.
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Jorge Patron,
%               Song Song
% ---------------------------------------------------------------------

x1=load('uscrime.dat');
x=x1(:,3:9);
[state,land,popu,acc,card,canc,pul,pneu,diab,liv,doc,hosp,r,d]=textread('ushealth.dat','%s %f %f %f %f %f %f %f %f %f %f %f %f %f');
y=horzcat(acc,card,canc,pul,pneu,diab,liv);     % Horizontal concatenation, creates data matrix

sxx=cov(x);
syy=cov(y);
sxy1=cov([x,y]);
sxy=[sxy1(1:7,8:14)];

%Calculating sxx12
[evec eval1]=eig(sxx);
eval=diag(eval1);

for i=1:length(eval)
    eval2(i)=sqrt(1/eval(i));
end
aa=diag(eval2);
sxx12=evec*aa*evec';

%Calculating syy12
[evec eval1]=eig(syy);
eval=diag(eval1);

for i=1:length(eval)
    eval2(i)=sqrt(1/eval(i));
end
aa=diag(eval2);
syy12=evec*aa*evec';

k=sxx12*sxy*syy12;

[g,l,d]=svd(k);

a=sxx12*g;
b=syy12*d;
eta=x*a;
phi=y*b;

hold on
xlabel('X');
ylabel('Y');
scatter(eta(:,1),phi(:,1),'k')
hold off







