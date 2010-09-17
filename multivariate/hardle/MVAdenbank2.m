% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAdenbank2
% ---------------------------------------------------------------------
% Description:  MVAdenbank2 computes the univariate densities of X4 and 
%               X5 of the genuine Swiss bank notes ("bank2.dat").   
% ---------------------------------------------------------------------
% Usage:        MVAdenbank2
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Univariate densities of X4 and X5 of the genuine Swiss 
%               bank notes ("bank2.dat").   
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Jorge Patron,
%               Song Song
% ---------------------------------------------------------------------

% Observation   Density estimates are different because Matlab uses a 'normal' 
%               kernel as default, whereas Xplore uses a Quartic kernel.
%               by Jorge Patron

x=load('bank2.dat');
x4=x(1:100,4);
[f1,xi1]=ksdensity(x4);
subplot(1,2,1);
plot(xi1,f1,'k','LineWidth',2)
axis ([6 12.8 0 0.6])
title('Swiss Bank Notes')
xlabel('Lower Inner Frame (X4)')
ylabel('Density')

x5=x(1:100,5);
[f2,xi2]=ksdensity(x5);
subplot(1,2,2);
plot(xi2,f2,'k','LineWidth',2)
axis ([6 12.8 0 0.6])
title('Swiss Bank Notes')
xlabel('Upper Inner Frame (X5)')
ylabel('Density')


