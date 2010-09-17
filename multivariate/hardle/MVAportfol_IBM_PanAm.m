% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAportfol_IBM_PanAm
% ---------------------------------------------------------------------
% Description:  MVAportfol computes the optimal portfolio weights with 
%               monthly returns of IBM and PanAm from Jan'78 to Dec'87.
%               The optimal portfolio is compared with an equally 
%               weighted one.
% ---------------------------------------------------------------------
% Usage:        MVAportfol
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Optimal portfolio weights with monthly returns of IBM 
%               and PanAm from Jan'78 to Dec'87. The optimal portfolio 
%               is compared with an equally weighted one.
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Song Song
% ---------------------------------------------------------------------

x1=load('ibm.dat');
x2=load('panam.dat');

x=[x1,x2];

s1=inv(cov(x));

one=[1 1];

aux1=s1*one';
aux2=one*s1*one';
c2=aux1./aux2;                   %c1,c2 weights
c1=one./sum(one);

q1=x*c1';                         %Optimal MVAportfolio returns
q2=x*c2;                          %Nonoptimal MVAportfolio returns

t=[1:120]';
d1=[t,q1];
d2=[t,q2];

subplot(2,2,1)
subplot('Position',[0.15 0.61 0.4 0.3])
hold on
for i=1:length(t)-1
    line([d1(i,1) d1(i+1,1)],[d1(i,2) d1(i+1,2)])
end
title('Equally Weighted Portfolio')
xlabel('X')
ylabel('Y')
xlim([0 120])
ylim([-0.4 0.4])

subplot(2,2,3)
subplot('Position',[0.15 0.1 0.4 0.3])
hold on
for i=1:length(t)-1
    line([d2(i,1) d2(i+1,1)],[d2(i,2) d2(i+1,2)])
end
title('Optimal Weighted Portfolio')
xlabel('X')
ylabel('Y')
xlim([0 120])
ylim([-0.4 0.4])

subplot(2,2,2)
axis off
hold on
text(0.5,1.06,'Weights')

w1=num2str(c1(1),'%10.3f');
w2=num2str(c1(2),'%10.3f');

text(0.5,0.85,w1)
text(0.5,0.75,w2)

text(0.9,0.85,'IBM')
text(0.9,0.75,'Pan Am')

subplot(2,2,4)
axis off
hold on
text(0.5,0.96,'Weights')

w1=num2str(c2(1),'%10.3f');
w2=num2str(c2(2),'%10.3f');

text(0.5,0.75,w1)
text(0.5,0.65,w2)

text(0.9,0.75,'IBM')
text(0.9,0.65,'Pan Am')
hold off
