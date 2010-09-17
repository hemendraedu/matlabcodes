% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAscabank456
% ---------------------------------------------------------------------
% Description:  MVAscabank456 computes a three dimensional scatterplot 
%               for X4 vs. X6 vs. X5 (lower inner frame vs. diagonal 
%               vs. upper inner frame) of the of the Swiss bank notes 
%               ("bank2.dat").
% ---------------------------------------------------------------------
% Usage:        MVAscabank456
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Three dimensional scatterplot for X4 vs. X6 vs. X5 
%               (lower inner frame vs. diagonal vs. upper inner frame) 
%               of the of the Swiss bank notes ("bank2.dat").   
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Michal Benko, Vladimir Georgescu, 
%               Jorge Patron, Song Song
% ---------------------------------------------------------------------

x=load('bank2.dat');      
x456=x(:,4:6);
hold on
scatter3(x456(1:100,1),x456(1:100,2),x456(1:100,3),'SizeData',75)
scatter3(x456(101:200,1),x456(101:200,2),x456(101:200,3),'*','r','SizeData',75)
title('Swiss bank notes')
xlabel('Lower inner frame (X4)')
ylabel('Upper inner frame (X5)')
zlabel('Diagonal (X6)')
hold off  

   