% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAboxhousing
% ---------------------------------------------------------------------
% Description:  MVAboxhousing computes Boxplots for the median value 
%				of houses closer and farther from the Charles River 
%               (Var. 4) respectively.
% ---------------------------------------------------------------------
% Usage:        MVAboxhousing
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Boxplots for the median value of houses closer and 
%               farther from the Charles River (Var. 4) respectively.
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Song Song
% ---------------------------------------------------------------------

x=load('bostonh.dat');
j=1;
k=1;
for i=1:length(x)
   if x(i,4)==1
       close(j)=x(i,14);
       j=j+1;
   else if x(i,4)==0
           far(k)=x(i,14);
           k=k+1;
       end
   end
end

close=close';
far=far';

hold on

far1=ones(length(close),1).*NaN;
boxplot([close far1],'labels',{'CLOSE','FAR'},'widths',0.8)

close1=ones(length(far),1).*NaN;
boxplot([close1 far],'labels',{'CLOSE','FAR'},'widths',0.8)

hold off
