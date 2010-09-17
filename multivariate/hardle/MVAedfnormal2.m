% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAedfnormal2
% ---------------------------------------------------------------------
% Description:  MVAedfnormal2 draws n=1000 observations from a standard 
%               normal distribution and plots its empirical distribution 
%               function (edf) vs. the normal cumulative distribution 
%               function (cdf).
% ---------------------------------------------------------------------
% Usage:        MVAedfnormal2
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Draws n=1000 observations from a standard normal 
%               distribution and plots its empirical distribution 
%               function (edf) vs. the normal cumulative distribution 
%               function (cdf).
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Jorge Patron,
%               Song Song
% ---------------------------------------------------------------------

y = normrnd(0,1,1000,1);
cdfplot(y)
hold on
x = -3:0.1:3;
f = normcdf(x,0,1);
plot(x,f,'r','LineWidth',2.5)
legend('Empirical','Theoretical','Location','NW')
title('EDF and CFD, n=1000')
xlabel('X')
ylabel('EDF(X), CDF(X)')
hold off