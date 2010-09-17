% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAMDScity2
% ---------------------------------------------------------------------
% Description:  MVAMDScity2 computes the map of the cities.  
% ---------------------------------------------------------------------
% Usage:        MVAMDScity2
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Map of the cities.
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Jorge Patron,
%               Song Song
% ---------------------------------------------------------------------

%Note: Matlab decomposes matrixes differently from Xplore(MVA book), and
%hence some of the eigenvectors have different signs. This does not change
%the results, but it does change the order of the graph by inverting the
%axes around the origin (Not always, and not necessarily all of the axis;
%it depends on which eigenvectors we choose to plot)

ber=[0 214 279 610 596 237];
dre=[214 0 492 533 496 444];
ham=[279 492 0 520 772 140];
kob=[610 533 520 0 521 687];
mue=[596 496 772 521 0 771];
ros=[237 444 140 687 771 0];

dist=[ber', dre', ham', kob', mue', ros'];

% aa, bb, hh, ii, rr, xx, xx1, xx2 are matrices
aa=(dist.^2).*(-0.5);

a=[1 0 0 0 0 0];
b=[0 1 0 0 0 0];
c=[0 0 1 0 0 0];
d=[0 0 0 1 0 0];
e=[0 0 0 0 1 0];
f=[0 0 0 0 0 1];

ii=[a' b' c' d' e' f'];
u=[1 1 1 1 1 1];

hh=ii-(1/6*(u'*u));

bb=hh*aa*hh;

[v e]=eigs(bb);

g1(:,1)=v(:,1);
g1(:,2)=-v(:,2);    % Multiplied here by -1 in order to get the same output as in XploRe

g2(1,1)=e(1,1);
g2(2,2)=e(2,2);
g2(1,2)=0;
g2(2,1)=0;

xx1=g1*(g2.^0.5);

x=cos(pi/2);
y=sin(pi/2);
z=-sin(pi/2);

rr(1,1)=x;
rr(1,2)=z;
rr(2,1)=y;
rr(2,2)=x;

xx2=xx1*rr;
xx=[(xx2(:,1)*(-1))+500 (xx2(:,2))+500];

hold on
scatter(xx(:,1),xx(:,2),'k')
title('Map of German Cities')
xlabel('EAST - WEST - DIRECTION in km')
ylabel('NORTH - SOUTH - DIRECTION in km')
xlim([0 900])
ylim([0 900])
text(xx(1,1)+20,xx(1,2),'Berlin','Color','b')
text(xx(2,1)+20,xx(2,2),'Dresden','Color','b')
text(xx(3,1)+20,xx(3,2),'Hamburg','Color','b')
text(xx(4,1)+20,xx(4,2),'Koblenz','Color','b')
text(xx(5,1)+20,xx(5,2),'Muenchen','Color','b')
text(xx(6,1)+20,xx(6,2),'Rostock','Color','b')


