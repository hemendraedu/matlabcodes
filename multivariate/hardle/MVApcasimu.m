% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVApcasimu
% ---------------------------------------------------------------------
% Description:  MVApcasimu simulates a projection of a (normal) point 
%               cloud which may capture differnt proportions of the 
%               variance. One should vary "nu" to see the effects.
%               (The chosen direction is always a linear combination of
%               the first and second PCA direction).   
% ---------------------------------------------------------------------
% Usage:        MVApcasimu
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Projection of a (normal) point cloud which may capture
%               differnt proportions of the variance. One should vary 
%               "nu" to see the effects.
%               (The chosen direction is always a linear combination of
%               the first and second PCA direction).    
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Jorge Patron,
%               Song Song
% ---------------------------------------------------------------------

nu=1;
%vary between 0 and 1!
n=200;

rho=0.5;
sig=[1   0.5
     0.5 1  ];

[vector,value] = eig(sig);

ll = sqrt(value);
sh = vector*ll*vector';

nr = normrnd(0,1,n,size(sig,1));

x = nr*sh';

for i=1:2
    e(3-i)=value(i,i);
end
v(:,1)=vector(:,2);
v(:,2)=-vector(:,1);

direction=nu*v(:,1)+(1-nu)*v(:,2);

norm=direction'*direction;
direction=direction./sqrt(norm);
pd=sort(x*direction);
d3=pd*direction';
d4(:,1)=x(:,1);
d4(:,2)=0;

subplot(3,1,1);
subplot('Position',[0.1 0.5 0.8 0.4])
hold on
title('Direction in Data');

scatter(x(:,1),x(:,2),'k');
plot(d3(:,1),d3(:,2),'r','LineWidth',1.5);


subplot('Position',[0.1 0.25 0.8 0.15])
title('Projection');
hold on
scatter(d4(:,1),d4(:,2),'k');

subplot('Position',[0.1 0.05 0.8 0.15]);
varexp=var(pd);
varsum=sum(var(x)');
varperc=varexp/varsum;
axis off
text(0,0.7,'Explained variance');
w=num2str(varexp,'%10.5f');
text(0.3,0.7,w);

text(0,0.4,'Total variance');
w=num2str(varsum,'%10.5f');
text(0.3,0.4,w);

text(0,0.1,'Explained percentage');
w=num2str(varperc,'%10.5f');
text(0.3,0.1,w);
hold off