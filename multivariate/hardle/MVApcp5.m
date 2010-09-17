% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVApcp5
% ---------------------------------------------------------------------
% Description:  Computes parallel coordinates plots for variables 
%               headroom, rear seat clearance and trunk space of car 
%               data. 
% ---------------------------------------------------------------------
% Usage:        MVApcp5
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Parallel coordinates plots for variables headroom, 
%               rear seat clearance and trunk space of car data. 
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Ji Cao, Song Song, Vladimir Georgescu             
% ---------------------------------------------------------------------

load carc.txt
z=carc
y=(z-(ones(74,1)*min(z)))./(ones(74,1)*(max(z)-min(z)+(max(z)==min(z))))
y=y(:,5:7)
label={'headroom','rear seat','trunk space'}
parallelcoords(y, 'linewidth',1.5, 'label', label,'Color','k')
legend('hide')
title('Parallel Coordinate Plot (Car Data)')