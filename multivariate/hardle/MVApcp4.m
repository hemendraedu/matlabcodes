% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVApcp4
% ---------------------------------------------------------------------
% Description:  Computes parallel coordinates plots for variables 
%               displacement, gear ratio for high gear and company 
%               headquarter of car data set.
% ---------------------------------------------------------------------
% Usage:        MVApcp4
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Parallel coordinates plots for variables displacement, 
%               gear ratio for high gear and company headquarter of car
%               data set.
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Ji Cao, Song Song, Vladimir Georgescu             
% ---------------------------------------------------------------------

load carc.txt
z=carc
y=(z-(ones(74,1)*min(z)))./(ones(74,1)*(max(z)-min(z)+(max(z)==min(z))))
y=y(:,11:13)
label={'displacement','gear ratio','headquarter'}
parallelcoords(y,'linewidth',1.5, 'label', label,'Color','k')
legend('hide')
title('Parallel Coordinate Plot (Car Data)')