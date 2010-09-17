% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAscabank45
% ---------------------------------------------------------------------
% Description:  MVAscabank45 computes a two dimensional scatterplot of 
%               X4 vs. X5 (upper inner frame vs. lower) of the Swiss 
%               bank notes data ("bank2.dat").        
% ---------------------------------------------------------------------
% Usage:        MVAscabank45
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Two dimensional scatterplot of X4 vs. X5 (upper inner 
%               frame vs. lower) of the Swiss bank notes data 
%               ("bank2.dat").        
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Michal Benko, Vladimir Georgescu, 
%               Jorge Patron, Song Song
% ---------------------------------------------------------------------

x=load('bank2.dat');        
scatter(x(:,4),x(:,5),'k','SizeData',75)
title('Swiss bank notes')
%xlabel('X4')
%ylabel('X5')
   