% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAportfol
% ---------------------------------------------------------------------
% Description:  MVAportfol computes the optimal portfolio weights with 
%               monthly returns of six US firms from Jan'78 to Dec'87. 
%               The optimal portfolio is compared with an equally 
%               weighted one.
% ---------------------------------------------------------------------
% Usage:        MVAportfol
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Computes the optimal portfolio weights with monthly 
%               returns of six US firms from Jan'78 to Dec'87. The 
%               optimal portfolio is compared with an equally weighted 
%               one.
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Song Song
% ---------------------------------------------------------------------

x1=load('ibm.dat');
x2=load('panam.dat');
x3=load('delta.dat');
x4=load('coned.dat');
x5=load('gerber.dat');
x6=load('texaco.dat');

ix=1:6;

% ix=1:2 if we want to show just IBM and Pan AM; Also the corresponding
% variables need to be changed from size 6 to size 2
% The case with only IBM and Pan Am is presented in the Matlet
% MVAportfol_IBM_PanAm

x=[x1,x2,x3,x4,x5,x6];

s1=inv(cov(x));

one=ones(1,length(ix));

aux1=s1*one';
aux2=one*s1*one';
c2=aux1./aux2;                    % c1,c2 weights
c1=one./sum(one);

q1=x*c1';                         % Optimal MVAportfolio returns
q2=x*c2;                          % Nonoptimal MVAportfolio returns

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
w3=num2str(c1(3),'%10.3f');
w4=num2str(c1(4),'%10.3f');
w5=num2str(c1(5),'%10.3f');
w6=num2str(c1(6),'%10.3f');

text(0.5,0.85,w1)
text(0.5,0.75,w2)
text(0.5,0.65,w3)
text(0.5,0.55,w4)
text(0.5,0.45,w5)
text(0.5,0.35,w6)

text(0.9,0.85,'IBM')
text(0.9,0.75,'Pan Am')
text(0.9,0.65,'Delta')
text(0.9,0.55,'Edison')
text(0.9,0.45,'Gerber')
text(0.9,0.35,'Texaco')

subplot(2,2,4)
axis off
hold on
text(0.5,0.96,'Weights')

w1=num2str(c2(1),'%10.3f');
w2=num2str(c2(2),'%10.3f');
w3=num2str(c2(3),'%10.3f');
w4=num2str(c2(4),'%10.3f');
w5=num2str(c2(5),'%10.3f');
w6=num2str(c2(6),'%10.3f');

text(0.5,0.75,w1)
text(0.5,0.65,w2)
text(0.5,0.55,w3)
text(0.5,0.45,w4)
text(0.5,0.35,w5)
text(0.5,0.25,w6)

text(0.9,0.75,'IBM')
text(0.9,0.65,'Pan Am')
text(0.9,0.55,'Delta')
text(0.9,0.45,'Edison')
text(0.9,0.35,'Gerber')
text(0.9,0.25,'Texaco')
hold off