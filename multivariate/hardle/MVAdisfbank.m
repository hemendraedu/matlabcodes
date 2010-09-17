% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAdisfbank
% ---------------------------------------------------------------------
% Description:  MVAdisfbank performs a Fisher discrimination analysis 
%               of the Swiss bank notes ("bank2.dat"), computes the
%               miss-classification rates for the whole dataset and
%               displays nonparametric density estimates of the 
%               projected data.
% ---------------------------------------------------------------------
% Usage:        MVAdisfbank
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Fisher discrimination analysis of the Swiss bank notes 
%               ("bank2.dat"), miss-classification rates for the whole  
%               dataset and plot of the  nonparametric density 
%               estimates of the projected data.
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Jorge Patron,
%               Song Song
% ---------------------------------------------------------------------

x=load('bank2.dat');
xg=x(1:100,:);
xf=x(101:200,:);

mg=mean(xg);
mf=mean(xf);
m=(mf+mg)/2;

w=99*(cov(xg)+cov(xf));
d=mg-mf;
a=inv(w)*d';

yg1=xg-repmat(m,100,1)
yf1=xf-repmat(m,100,1)


yg=yg1*a;
yf=yf1*a;

% Number of misclassified
sumg=0;
for i=1:length(yg)
    if yg(i)<0
        sumg=sumg+1;
    end
end
disp('Number of missclassified genuine notes');
sumg

sumf=0;
for i=1:length(yf)
    if yf(i)>0
        sumf=sumf+1;
    end
end
disp('Number of missclassified forged notes');
sumf

[f1,ygi1]=ksdensity(yg); 
[f2,ygi2]=ksdensity(yf);

hold on
title('Swiss Bank Notes');
ylabel('Densities of Projections');
xlim([-0.2 0.2]);
plot(ygi1,f1,'color','b','LineWidth',2,'LineStyle','--');
plot(ygi2,f2,'color','r','LineWidth',2);
text(-0.14,3.5,'Forged','Color','r');
text(0.1,2,'Genuine','Color','b');
hold off
