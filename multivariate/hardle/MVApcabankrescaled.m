% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVApcabankrescaled
% ---------------------------------------------------------------------
% Description:  MVApcabankrescaled performs a PCA for the Swiss bank 
%               notes ("bank2.dat"), where columns 1, 2, 3, 6 are 
%               rescaled to centimeters and shows the first three 
%               principal components in two-dimensional scatterplots. 
%               Additionally, a screeplot of the eigenvalues is 
%               displayed. 
% ---------------------------------------------------------------------
% Usage:        MVApcabankrescaled
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       PCA for the Swiss bank notes("bank2.dat"), where
%               columns 1, 2, 3, 6 are rescaled to centimeters and 
%               shows the first three principal components in 
%               two-dimensional scatterplots. Additionally, a screeplot 
%               of the eigenvalues is displayed. 
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
% In this case, the plots are inverted(Compared with plots in the book)     

x=load('bank2.dat');
y=vertcat(ones(100,1),zeros(100,1));
[n p]=size(x);

x(:,1)=x(:,1)/10;
x(:,2)=x(:,2)/10;
x(:,3)=x(:,3)/10;
x(:,6)=x(:,6)/10;

adjust=(n-1)*cov(x)/n;
[v e]=eigs(adjust,p,'la'); % Calculates eigenvalues and eigenvectors and sorts them by size
e1=(e*ones(p,1))';         % Creates column vector of eigenvalues

%Plotting Eigenvalues
nr=1:6;
subplot(2,2,4)
scatter(nr,e1,'k')
xlabel('Index')
ylabel('Lambda')
title('Eigenvalues of S')
xlim([0.5 6.5])
ylim([-0.2 2.5])


x=x*v;
%Plot of the first vs. second PC
subplot(2,2,1)
gscatter(x(:,1),x(:,2),y,'br','+o',5,'off')
xlabel('PC1 ')
ylabel('PC2 ')
title('First vs. Second PC')

%Plot of the second vs. third PC
subplot(2,2,2)
gscatter(x(:,2),x(:,3),y,'br','+o',5,'off')
xlabel('PC2 ')
ylabel('PC3 ')
title('Second vs. Third PC')

%Plot of the first vs. third PC
subplot(2,2,3)
gscatter(x(:,1),x(:,3),y,'br','+o',5,'off')
xlabel('PC1 ')
ylabel('PC3 ')
title('First vs. Third PC')
hold off