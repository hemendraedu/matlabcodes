% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAnpcahous
% ---------------------------------------------------------------------
% Description:  MVAnpcahous performs a PCA for the standarized Boston 
%               housing data ("bostonh.dat"). It shows the first two
%               principal components and a screeplot of the 
%               eigenvalues.
% ---------------------------------------------------------------------
% Usage:        MVAnpcahous
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       PCA for the standarized Boston housing data 
%               ("bostonh.dat"). It shows the first two principal 
%               components and a screeplot of the eigenvalues.
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Jorge Patron, Vladimir Georgescu, 
%               Song Song
% ---------------------------------------------------------------------

x=load('bostonh.dat');

%Transformations
xt(:,1)=log(x(:,1));
xt(:,2)=x(:,2)/10;
xt(:,3)=log(x(:,3));
xt(:,4)=x(:,4);
xt(:,5)=log(x(:,5));
xt(:,6)=log(x(:,6));
xt(:,7)=(power(x(:,7),2.5))/10000;
xt(:,8)=log(x(:,8));
xt(:,9)=log(x(:,9));
xt(:,10)=log(x(:,10));
xt(:,11)=exp(0.4*x(:,11))/1000;
xt(:,12)=x(:,12)/100;
xt(:,13)=sqrt(x(:,13));
xt(:,14)=log(x(:,14));

x1=horzcat(xt(:,1:3),xt(:,5:14));

[n p]=size(x1);
m=mean(x1);
x1=(x1-repmat(m,n,1)).*repmat(1./sqrt((n-1)*var(x1)/n),n,1);    % Standardizes the data matrix

adjust=(n-1)*cov(x1)/n;

[v e]=eigs(adjust,p,'la');                                      % Returns eigenvalues and eigenvectors sorted by size
e1=(e*ones(p,1))';                                              % Turns Eigenvalue matrix into a row vector

xv=x1*v;

figure(1)
for i=1:length(x)
    if x1(i,13)<mean(x1(:,13))
        hold on
        plot(xv(i,1),xv(i,2),'^','color','k','MarkerSize',5) % Multiply second column by -1 to invert graph so that it looks the same as in the MVA book
    else 
        plot(xv(i,1),xv(i,2),'s','Color','r','MarkerSize',4) % Multiply second column by -1 to invert graph so that it looks the same as in the MVA book
    end
end
xlabel('PC1 ')
ylabel('PC2 ')
title('First vs. Second PC')
xlim([-7 7])
ylim([-4.5 3])

figure(2)
gscatter(xv(:,1),xv(:,2),xt(:,4),'kr','^s',5,'doleg=off')    % Second vector multiplied by minus one to invert the plot.
xlabel('PC1 ')
ylabel('PC2 ')
title('First vs. Second PC')
xlim([-7 7])
ylim([-4.5 3])
