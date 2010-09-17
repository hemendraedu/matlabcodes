% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAreturns
% ---------------------------------------------------------------------
% Description:  MVAreturns shows monthly returns of six US firms from 
%               Jan'78 to Dec'87.
% ---------------------------------------------------------------------
% Usage:        MVAreturns
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Monthly returns of six US firms from Jan'78 to Dec'87.
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

t=[1:120]';

d1=[t x1];
d2=[t x2];
d3=[t x3];
d4=[t x4];
d5=[t x5];
d6=[t x6];

subplot(3,2,1)
hold on
for i=1:length(t)-1
    line([d1(i,1) d1(i+1,1)],[d1(i,2) d1(i+1,2)])
end
title('IBM')
xlabel('X')
ylabel('Y')
xlim([0 120])
ylim([-0.4 0.4])

subplot(3,2,2)
hold on
for i=1:length(t)-1
    line([d4(i,1) d4(i+1,1)],[d4(i,2) d4(i+1,2)])
end
title('Consolidated Edison')
xlabel('X')
ylabel('Y')
xlim([0 120])
ylim([-0.4 0.4])

subplot(3,2,3)
hold on
for i=1:length(t)-1
    line([d2(i,1) d2(i+1,1)],[d2(i,2) d2(i+1,2)])
end
title('PanAm')
xlabel('X')
ylabel('Y')
xlim([0 120])
ylim([-0.4 0.4])

subplot(3,2,4)
hold on
for i=1:length(t)-1
    line([d5(i,1) d5(i+1,1)],[d5(i,2) d5(i+1,2)])
end
title('Gerber')
xlabel('X')
ylabel('Y')
xlim([0 120])
ylim([-0.4 0.4])

subplot(3,2,5)
hold on
for i=1:length(t)-1
    line([d3(i,1) d3(i+1,1)],[d3(i,2) d3(i+1,2)])
end
title('Delta Airlines')
xlabel('X')
ylabel('Y')
xlim([0 120])
ylim([-0.4 0.4])

subplot(3,2,6)
hold on
for i=1:length(t)-1
    line([d6(i,1) d6(i+1,1)],[d6(i,2) d6(i+1,2)])
end
title('Texaco')
xlabel('X')
ylabel('Y')
xlim([0 120])
ylim([-0.4 0.4])
hold off




