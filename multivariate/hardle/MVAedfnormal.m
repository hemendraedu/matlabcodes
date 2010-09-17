% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAedfnormal
% ---------------------------------------------------------------------
% Description:  MVAedfnormal simulates data from a standard normal #
%               distribution and plots its empirical distribution 
%               function (edf) vs. the normal cumulative distribution
%               function (cdf).
% ---------------------------------------------------------------------
% Usage:        MVAedfnormal
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Simulates data from a standard normal distribution and 
%               plots its empirical distribution function (edf) vs. the 
%               normal cumulative distribution function (cdf).
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Jorge Patron,
%               Song Song
% ---------------------------------------------------------------------


y = normrnd(0,1,100,1);
cdfplot(y)
hold on
x = -3:0.1:3;
f = normcdf(x,0,1);
plot(x,f,'r','LineWidth',2.5)
legend('Empirical','Theoretical','Location','NW')
title('EDF and CDF, n=100')
xlabel('X')
ylabel('EDF(X), CDF(X)')
hold off
