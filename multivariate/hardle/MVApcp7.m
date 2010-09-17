% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVApcp7
% ---------------------------------------------------------------------
% Description:  Computes parallel coordinates plot.
% ---------------------------------------------------------------------
% Usage:        MVApcp7
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Parallel coordinates plot with intersection.
% ---------------------------------------------------------------------
% Example:      For two given data points, a parallel plot with 
%               intersection is shown.
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Ji Cao, Song Song, Vladimir Georgescu             
% ---------------------------------------------------------------------

z1=[0,2,3,2]
z2=[3,2,2,1]
z=[z1;z2]
parallelcoords(z, 'linewidth',2,'Color','k')
legend('hide')
title('Parallel Coordinate Plot')
text(1.5,1.3,'A')
text(1.5,2.6,'B')