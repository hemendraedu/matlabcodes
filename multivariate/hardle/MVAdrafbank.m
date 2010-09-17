% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAdrafbank
% ---------------------------------------------------------------------
% Description:  MVAdrafbank computes a Draftman Plot for columns 3, 4, 
%               5 and 6 of the Swiss bank notes data ("bank2.dat").
% ---------------------------------------------------------------------
% Usage:        MVAdrafbank
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Draftman Plot for columns 3, 4, 5 and 6 of the Swiss
%                bank notes data ("bank2.dat").
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Song Song
% ---------------------------------------------------------------------

x=load('bank2.dat');
x3456=x(:,3:6);


for i=1:4
    for j=1:i-1      
        subplot(4,4,(i-1)*4+j)
        plot(x3456(1:100,j),x3456(1:100,i),'ob','MarkerSize',4);
        hold on
        plot(x3456(101:200,j),x3456(101:200,i),'*r','MarkerSize',4);
        axis off
    end
   
end
subplot(4,4,1)
axis off
text(0.3,0.5,'VAR 1')

subplot(4,4,6)
axis off
text(0.3,0.5,'VAR 2')

subplot(4,4,11)
axis off
text(0.3,0.5,'VAR 3')

subplot(4,4,16)
axis off
text(0.3,0.5,'VAR 4')
hold off
