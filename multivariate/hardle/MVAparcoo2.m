% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAparcoo2
% ---------------------------------------------------------------------
% Description:  MVAparcoo2 computes a parallel coordinate plot for the 
%               observations full bank note data set ("bank2.dat").
% ---------------------------------------------------------------------
% Usage:        MVAparcoo2
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Computes a parallel coordinate plot for the 
%               observations full bank note data set ("bank2.dat").
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Michal Benko, Vladimir Georgescu, 
%               Jorge Patron, Song Song
% ---------------------------------------------------------------------

 x=load('bank2.dat');    
 z=x; 
 s=size(z);

 minz=repmat(min(z),s(1,1),1);
 maxmin=repmat(max(z)-min(z),s(1,1),1);
 z=(z-minz)./(maxmin);       % standardizes the data 
 z=z';
 
 hold on
 plot(z(:,1:100),'Color','k','LineWidth',2)
 plot(z(:,101:200),'Color','r','LineWidth',2,'LineStyle','-.')
 hold off
 title('Parallel coordinate plot (Bank data)')

 
 
