% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVApcabanki
% ---------------------------------------------------------------------
% Description:  MVApcabanki shows a screeplot of the eigenvalues for 
%               the PCA of the Swiss bank notes ("bank2.dat"). It 
%               computes the correlations between the variables and the
%               principal components and displays the first two of them.
% ---------------------------------------------------------------------
% Usage:        MVApcabanki
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Screeplot of the eigenvalues for the PCA of the Swiss 
%               bank notes ("bank2.dat"). It computes the correlations 
%               between the variables and the principal components and 
%               displays the first two of them.
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Jorge Patron, Vladimir Georgescu, 
%               Song Song
% ---------------------------------------------------------------------

% Note: Matlab decomposes matrixes differently from Xplore(MVA book), and
% hence some of the eigenvectors have different signs. This does not change
% the results, but it does change the order of the graph by inverting the
% axes around the origin (Not always, and not necessarily all of the axis;
% it depends on which eigenvectors we choose to plot)
% In this case, the plots are inverted (Compared with plots in the book)     

x=load('bank2.dat');
[n p]=size(x);
adjust=(n-1)*cov(x)/n;
[v e]=eigs(adjust,p,'la'); % Calculates eigenvalues and eigenvectors and sorts them by size
e1=(e*ones(p,1))';         % Creates column vector of eigenvalues
s=sum(e1);
e1=e1/s;

%Plotting Relative proportion of variance explained by PCs
nr=1:6;
figure(2)
scatter(nr,e1,75,'k')
xlabel('Index')
ylabel('Variance Explained')
title('Swiss Bank Notes')
xlim([0.5 6.5])
ylim([-0.02 0.8])


m=mean(x);
temp=x-repmat(m,n,1);
r=temp*v;
r=horzcat(r,x);
r=corr(r);
r1=r(7:12,1:2);


figure(1)
hold on
xlim([-1.2 1.2])
ylim([-1.2 1.2])
line([-1.2 1.2],[0 0],'Color','k')
line([0 0],[1.2 -1.2],'Color','k')
title('Swiss Bank Notes')
xlabel('First PC')
ylabel('Second PC')

circle = rsmak('circle');
fnplt(circle)

text(r1(1,1),r1(1,2),'X1')
text(r1(2,1),r1(2,2),'X2')
text(r1(3,1),r1(3,2),'X3')
text(r1(4,1),r1(4,2),'X4')
text(r1(5,1),r1(5,2),'X5')
text(r1(6,1),r1(6,2),'X6')
hold off
