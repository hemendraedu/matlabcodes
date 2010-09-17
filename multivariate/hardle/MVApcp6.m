% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVApcp6
% ---------------------------------------------------------------------
% Description:  Computes Boxplots for variables headroom, rear seat 
%               clearance and trunk space of car data. 
% ---------------------------------------------------------------------
% Usage:        MVApcp6
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Boxplots for variables headroom, rear seat clearance 
%               and trunk space of car data. 
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Ji Cao, Song Song, Vladimir Georgescu             
% ---------------------------------------------------------------------

load carc.txt
z=carc;
z=z(:,5:7);
m1=mean(z(:,1));
m2=mean(z(:,2));
m3=mean(z(:,3));
 hold on
 line([0.775 1.225],[m1 m1],'Color','k','LineStyle',':','LineWidth',1.2)
 line([1.775 2.225],[m2 m2],'Color','k','LineStyle',':','LineWidth',1.2)
 line([2.775 3.225],[m3 m3],'Color','k','LineStyle',':','LineWidth',1.2)
boxplot(z,'Symbol','o','labels',{'headroom','rear seat','trunk space'})
legend('hide')
title('Boxplot (Car Data)')
hold off