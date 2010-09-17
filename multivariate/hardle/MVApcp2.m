% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVApcp2
% ---------------------------------------------------------------------
% Description:  Computes parallel coordinates plots for variables weight 
%               and displacement of the car data set.
% ---------------------------------------------------------------------
% Usage:        MVApcp2
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Parallel coordinates plots for variables weight and 
%               displacement of the car data set.
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Ji Cao, Song Song, Vladimir Georgescu             
% ---------------------------------------------------------------------

load carc.txt
z=carc;
y=(z-(ones(74,1)*min(z)))./(ones(74,1)*(max(z)-min(z)+(max(z)==min(z))));
y=[y(:,8) y(:,11)];
label={'weight','displacement'};
parallelcoords(y,'linewidth',1.5,'label', label,'Color','k')
legend('hide')
title('Parallel Coordinate Plot (Car Data)')