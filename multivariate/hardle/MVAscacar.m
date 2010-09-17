% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAscacar
% ---------------------------------------------------------------------
% Description:  MVAscacar computes a two dimensional scatterplot of X2 
%               (mileage) and X8 (weight) from the car data set.
% ---------------------------------------------------------------------
% Usage:        MVAscacar
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Two dimensional scatterplot of X2 (mileage) and X8 
%               (weight) from the car data set.
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Jorge Patron, Vladimir Georgescu, 
%               Song Song
% ---------------------------------------------------------------------

[model,P,M,R78,R77,H,R,Tr,W,L,T,D,G,C]=textread('carc.dat','%s %f %f %c %c %f %f %f %f %f %f %f %f %f','emptyvalue',NaN);
gscatter(M,W,C,'krb','*o+',8)        % scatterplot of mileage vs weight grouping by country
title('Car Data')
xlabel('Mileage (X2)')
ylabel('Weight (X8)')
h=legend('USA','JAPAN','EUROPE',1);% the #1 controls for the position of the legend
set(h,'Interpreter','none')        % sets the legend on the plot
