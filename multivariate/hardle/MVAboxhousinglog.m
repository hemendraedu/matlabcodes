% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAboxhousinglog
% ---------------------------------------------------------------------
% Description:  MVAboxhousinglog computes Boxplots for the log of 
%               median value of houses closer and farther from the 
%               Charles River (Var. 4) respectively.
% ---------------------------------------------------------------------
% Usage:        MVAboxhousinglog
%----------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Boxplots for the log of median value of houses closer 
%               and farther from the Charles River (Var. 4) 
%               respectively.
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
       close(j)=log(x(i,14));
       j=j+1;
   else if x(i,4)==0
           far(k)=log(x(i,14));
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

