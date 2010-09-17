% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAscapull2
% ---------------------------------------------------------------------
% Description:  MVAscapull2 computes a two dimensional plot of X4 
%               (assistants) and X1 (sales) from the pullovers data 
%               set.
% ---------------------------------------------------------------------
% Usage:        MVAscapull2
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Two dimensional plot of X4 (assistants) and X1 (sales) 
%               from the pullovers data set.
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Jorge Patron, 
%               Song Song
% ---------------------------------------------------------------------

x=load('pullover.dat');       
scatter(x(:,4),x(:,1),75,'k')
title('Pullovers Data')
xlabel('Sales Assistants (X4)')
ylabel('Sales (X1)')
 
 