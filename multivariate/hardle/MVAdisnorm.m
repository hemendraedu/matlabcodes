% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAdisnorm
% ---------------------------------------------------------------------
% Description:  MVAdisnorm displays graphically the maximum likelihood 
%               (ML) discrimination rule for 2 normal distributed
%               samples. The inner interval is the allocation set for 
%               N(1,0.25), the outer intervals are for observations 
%               from N(0,1).
% ---------------------------------------------------------------------
% Usage:        MVAdisnorm
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Maximum likelihood (ML) discrimination rule for 2 
%               normal distributed samples. The inner interval is the 
%               allocation set for N(1,0.25), the outer intervals are 
%               for observations from N(0,1).
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Jorge Patron,
%               Song Song
% ---------------------------------------------------------------------

t=-3:0.05:3;

pdfn1=normpdf(0,t,1);
f1=[t',pdfn1'];

s2=0.5;
mu2=1;

pdfn2=normpdf(0,(t-mu2)/s2,1);
f2=[t',(pdfn2/s2)'];

hold on
title('2 Normal Distributions');
ylabel('Densities');
plot(f1(:,1),f1(:,2),'r','LineWidth',1.5)
plot(f2(:,1),f2(:,2),'b','LineStyle','--','Linewidth',1.5)

% Vector of points for labels
p1=[-1 1.3 2.6];
p2=[0.4 0.4 0.4];
p=[p1',p2'];
text(p(1,1),p(1,2),'R1','Color','r');
text(p(2,1),p(2,2),'R2','Color','r');
text(p(3,1),p(3,2),'R1','Color','r');

% First and second discrimination points
c1=4/3-sqrt(4+6*log(2))/3;
c2=4/3+sqrt(4+6*log(2))/3;

max1=max(max(f1(:,2)),max(f2(:,2)));

line([c1 c1],[max1 0],'Color','k','LineWidth',2) 
line([c2 c2],[max1 0],'Color','k','LineWidth',2) 
hold off





