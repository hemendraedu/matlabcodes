% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAboxcity
% ---------------------------------------------------------------------
% Description:  MVAboxcity computes the Five Number Summary and a Boxplot 
%               for 1st column of the dataset popul.dat. 
% ---------------------------------------------------------------------
% Usage:        MVAboxcity
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Five Number Summary and a Boxplot for 1st column of the
%               dataset popul.dat. 
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Jorge Patron, Vladimir Georgescu,  
%               Song Song
% ---------------------------------------------------------------------

x=load('city.dat');
m1=mean(x);
hold on
boxplot(x,'Symbol','o','label',{'World Cities'},'widths',0.5)
line([0.75 1.25],[m1 m1],'Color','k','LineStyle',':','LineWidth',1.2)
title('Boxplot')
hold off
%Five Number Summary%
%Matlab "quantile" function uses a different algorithm to calculate the sample quantiles than in the MVA book%
%Therefore, the values using Matlab could differ from the Book values, but
%the difference is not great, and should not be significant.
%Easiest way to calculate Five Number Summary is
% quantile(population,[.025 .25 .50 .75 .975])
five=quantile(x,[.025 .25 .50 .75 .975])
five



