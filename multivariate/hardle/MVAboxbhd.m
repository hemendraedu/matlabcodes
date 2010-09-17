% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAboxbhd
% ---------------------------------------------------------------------
% Description:  MVAboxbhd computes Boxplots for the 14 variables of
%			    Boston Housing data.
% ---------------------------------------------------------------------
% Usage:        MVAboxbhd
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Boxplots for the 14 variables of Boston Housing data.
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Jorge Patron, 
%               Song Song
% ---------------------------------------------------------------------

x=load('bostonh.dat');   

%Standardizing data
for i=1:14
    zz(:,i)=(x(:,i)-mean(x(:,i)))/(sqrt(var(x(:,i))));
end

subplot(2,1,1)
hold on
boxplot(zz,'Symbol','o')
%for i=1:14
    line([ 0.75  1.25],[mean(zz(:,1)) mean(zz(:,1))],'Color','k','LineStyle',':','LineWidth',1.2)
    line([ 1.75  2.25],[mean(zz(:,2)) mean(zz(:,2))],'Color','k','LineStyle',':','LineWidth',1.2)
    line([ 2.75  3.25],[mean(zz(:,3)) mean(zz(:,3))],'Color','k','LineStyle',':','LineWidth',1.2)
    line([ 3.75  4.25],[mean(zz(:,4)) mean(zz(:,4))],'Color','k','LineStyle',':','LineWidth',1.2)
    line([ 4.75  5.25],[mean(zz(:,5)) mean(zz(:,5))],'Color','k','LineStyle',':','LineWidth',1.2)
    line([ 5.75  6.25],[mean(zz(:,6)) mean(zz(:,6))],'Color','k','LineStyle',':','LineWidth',1.2)
    line([ 6.75  7.25],[mean(zz(:,7)) mean(zz(:,7))],'Color','k','LineStyle',':','LineWidth',1.2)
    line([ 7.75  8.25],[mean(zz(:,8)) mean(zz(:,8))],'Color','k','LineStyle',':','LineWidth',1.2)
    line([ 8.75  9.25],[mean(zz(:,9)) mean(zz(:,9))],'Color','k','LineStyle',':','LineWidth',1.2)
    line([ 9.75 10.25],[mean(zz(:,10)) mean(zz(:,10))],'Color','k','LineStyle',':','LineWidth',1.2)
    line([10.75 11.25],[mean(zz(:,11)) mean(zz(:,11))],'Color','k','LineStyle',':','LineWidth',1.2)
    line([11.75 12.25],[mean(zz(:,12)) mean(zz(:,12))],'Color','k','LineStyle',':','LineWidth',1.2)
    line([12.75 13.25],[mean(zz(:,13)) mean(zz(:,13))],'Color','k','LineStyle',':','LineWidth',1.2)
    line([13.75 14.25],[mean(zz(:,14)) mean(zz(:,14))],'Color','k','LineStyle',':','LineWidth',1.2)
%end
title('Boston Housing Data')
axis off
hold off

subplot(2,1,2)
%Transformations
xt(:,1)=log(x(:,1));
xt(:,2)=x(:,2)/10;
xt(:,3)=log(x(:,3));
xt(:,4)=x(:,4);
xt(:,5)=log(x(:,5));
xt(:,6)=log(x(:,6));
xt(:,7)=(power(x(:,7),2.5))/10000;
xt(:,8)=log(x(:,8));
xt(:,9)=log(x(:,9));
xt(:,10)=log(x(:,10));
xt(:,11)=exp(0.4*x(:,11))/1000;
xt(:,12)=x(:,12)/100;
xt(:,13)=sqrt(x(:,13));
xt(:,14)=log(x(:,14));

%Standardizing data
for i=1:14
    tt(:,i)=(xt(:,i)-mean(xt(:,i)))/(sqrt(var(xt(:,i))));
end
boxplot(tt,'Symbol','o')
line([ 0.75  1.25],[mean(tt(:,1)) mean(tt(:,1))],'Color','k','LineStyle',':','LineWidth',1.2)
line([ 1.75  2.25],[mean(tt(:,2)) mean(tt(:,2))],'Color','k','LineStyle',':','LineWidth',1.2)
line([ 2.75  3.25],[mean(tt(:,3)) mean(tt(:,3))],'Color','k','LineStyle',':','LineWidth',1.2)
line([ 3.75  4.25],[mean(tt(:,4)) mean(tt(:,4))],'Color','k','LineStyle',':','LineWidth',1.2)
line([ 4.75  5.25],[mean(tt(:,5)) mean(tt(:,5))],'Color','k','LineStyle',':','LineWidth',1.2)
line([ 5.75  6.25],[mean(tt(:,6)) mean(tt(:,6))],'Color','k','LineStyle',':','LineWidth',1.2)
line([ 6.75  7.25],[mean(tt(:,7)) mean(tt(:,7))],'Color','k','LineStyle',':','LineWidth',1.2)
line([ 7.75  8.25],[mean(tt(:,8)) mean(tt(:,8))],'Color','k','LineStyle',':','LineWidth',1.2)
line([ 8.75  9.25],[mean(tt(:,9)) mean(tt(:,9))],'Color','k','LineStyle',':','LineWidth',1.2)
line([ 9.75 10.25],[mean(tt(:,10)) mean(tt(:,10))],'Color','k','LineStyle',':','LineWidth',1.2)
line([10.75 11.25],[mean(tt(:,11)) mean(tt(:,11))],'Color','k','LineStyle',':','LineWidth',1.2)
line([11.75 12.25],[mean(tt(:,12)) mean(tt(:,12))],'Color','k','LineStyle',':','LineWidth',1.2)
line([12.75 13.25],[mean(tt(:,13)) mean(tt(:,13))],'Color','k','LineStyle',':','LineWidth',1.2)
line([13.75 14.25],[mean(tt(:,14)) mean(tt(:,14))],'Color','k','LineStyle',':','LineWidth',1.2)
title('Transformed Boston Housing Data')
axis off
