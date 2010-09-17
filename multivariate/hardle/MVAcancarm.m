% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAcancarm
% ---------------------------------------------------------------------
% Description:  MVAcancarm performs a canonical correlation analysis 
%               for the car marks data ("carmean2.dat") and shows 
%               a plot of the first canonical variables.
% ---------------------------------------------------------------------
% Usage:        MVAcancarm
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Canonical correlation analysis for the car marks data 
%               ("carmean2.dat") and shows a plot of the first 
%               canonical variables.
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
%it depends on which eigenvectors we choose to plot).
%In this particular quantlet there is also a difference between the way in
%which the Single Value Decomposition (SVD) is performed in Matlab and
%XploRe.
 
[type, economy, service, value, price, design, sporty, safety, handling]=textread('carmean2.dat','%s %f %f %f %f %f %f %f %f');

cars1=horzcat(economy, service, value, price, design, sporty, safety, handling); % Horizontal concatenation, creates data matrix

%Reordering the columns of the matrix
cars=[cars1(:,4),cars1(:,3),cars1(:,1:2),cars1(:,5:8)];
s=cov(cars);

sa=s(1:2,1:2);
sb=s(3:8,3:8);

[va1 ea1]=eigs(sa);
[vb1 eb1]=eigs(sb);
ea=diag(ea1);
eb=diag(eb1);
sa2=va1*diag(1./sqrt(ea))*va1';
sb2=vb1*diag(1./sqrt(eb))*vb1';

k=sa2*s(1:2,3:8)*sb2;
[g,l,d]=svd(k);

a=sa2*g;
b=sb2*d;
eta=cars(:,1:2)*a(:,2);
phi=cars(:,3:8)*b(:,2);
etaphi=[eta,phi];
etaphi=etaphi';
hold on
s=['Audi       '
   'BMW        '
   'Citroen    '
   'Ferrari    '
   'Fiat       '
   'Ford       '
   'Hyundai    '
   'Jaguar     '
   'Lada       '
   'Mazda      '
   'Mercedes   '
   'Mitsubishi '
   'Nissan     '
   'Opel Corsa '
   'Opel Vectra'
   'Peugeot    '
   'Renault    '
   'Rover      '
   'Toyota     '
   'Trabant    '
   'VW Golf    '
   'VW Passat  '
   'Wartburg   '];

scatter(etaphi(1,:),etaphi(2,:),'.','w')
for i=1:23
    text(etaphi(1,i),etaphi(2,i),s(i,1:11));
end

title('Car Marks Data');
xlabel('Eta 1');
ylabel('Phi 1');
