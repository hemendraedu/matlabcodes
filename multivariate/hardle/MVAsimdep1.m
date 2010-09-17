% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAsimdep1
% ---------------------------------------------------------------------
% Description:  MVAsimdep1 illustrates simplicial depth. 
% ---------------------------------------------------------------------
% Usage:        MVAsimdep1
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Simplicial depth.
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Song Song
% ---------------------------------------------------------------------

t=[1:6]';
a=[10 0 5 5 4 9]'
x1=[t,a];

axis off
hold on

text(x1(1,1)+0.1,x1(1,2),'1')
plot(x1(1,1),x1(1,2),'.','Color','k','MarkerSize',15)
text(x1(2,1)+0.1,x1(2,2),'6')
plot(x1(2,1),x1(2,2),'.','Color','k','MarkerSize',15)
text(x1(3,1)+0.1,x1(3,2),'3')
plot(x1(3,1),x1(3,2),'.','Color','k','MarkerSize',15)
text(x1(4,1)+0.1,x1(4,2),'4')
plot(x1(4,1),x1(4,2),'.','Color','k','MarkerSize',15)
text(x1(5,1)+0.1,x1(5,2),'5')
plot(x1(5,1),x1(5,2),'.','Color','k','MarkerSize',15)
text(x1(6,1)+0.1,x1(6,2),'2')
plot(x1(6,1),x1(6,2),'.','Color','k','MarkerSize',15)

line([x1(1,1) x1(3,1)],[x1(1,2) x1(3,2)],'Color','r','LineWidth',2,'LineStyle','--')
line([x1(3,1) x1(5,1)],[x1(3,2) x1(5,2)],'Color','r','LineWidth',2,'LineStyle','--')
line([x1(5,1) x1(1,1)],[x1(5,2) x1(1,2)],'Color','r','LineWidth',2,'LineStyle','--')
line([x1(2,1) x1(3,1)],[x1(2,2) x1(3,2)],'Color','b','LineWidth',2,'LineStyle','--')
line([x1(3,1) x1(6,1)],[x1(3,2) x1(6,2)],'Color','b','LineWidth',2,'LineStyle','--')
line([x1(6,1) x1(2,1)],[x1(6,2) x1(2,2)],'Color','b','LineWidth',2,'LineStyle','--')
title('Simplicial Depth Example')
hold off


