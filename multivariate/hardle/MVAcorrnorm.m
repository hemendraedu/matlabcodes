% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAcorrnorm
% ---------------------------------------------------------------------
% Description:  MVAcorrnorm computes a two dimensional scatterplot of 
%               two correlated normal random variables.  
% ---------------------------------------------------------------------
% Usage:        MVAcorrnorm
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Scatterplot of two correlated normal random variables.  
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Jorge Patron,
%               Song Song
% ---------------------------------------------------------------------

n=150;

sig=[1 0.8
     0.8 1];

[vector,value] = eig(sig);
ll = sqrt(value);
sh = vector*ll*vector';

nr = normrnd(0,1,n,size(sig,1));

y = nr*sh';

scatter(y(:,1),y(:,2),75,'k')
title('Normal sample, n=150')
xlabel('X')
ylabel('Y')

xlim=([-3 3])
ylim=([-3 3])

