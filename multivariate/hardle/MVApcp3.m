% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVApcp3
% ---------------------------------------------------------------------
% Description:  Computes parallel coordinates plots for variables mileage 
%               and weight car data set.
% ---------------------------------------------------------------------
% Usage:        MVApcp3
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Parallel coordinates plots for variables mileage 
%               and weight car data set.
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Ji Cao, Song Song, Vladimir Georgescu             
% ---------------------------------------------------------------------

load carc.txt
z=carc
y=(z-(ones(74,1)*min(z)))./(ones(74,1)*(max(z)-min(z)+(max(z)==min(z))))
y=[y(:,2) y(:,8)]
label={'mileage','weight'};
parallelcoords(y,'linewidth',1.5,'label',label,'Color','k')
legend('hide')
title('Parallel Coordinate Plot(Car Data)')