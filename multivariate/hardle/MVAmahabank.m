% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAmahabank
% ---------------------------------------------------------------------
% Description:  MVAmahabank computes a spectral decomposition of 
%               covariance matrix of the Swiss bank notes ("bank2.dat") 
%               and does a Mahalanobis transformation.    
% ---------------------------------------------------------------------
% Usage:        MVAmahabank
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Spectral decomposition of covariance matrix of the 
%               Swiss bank notes ("bank2.dat") and does a Mahalanobis 
%               transformation. 
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Song Song
% ---------------------------------------------------------------------

x1=load('bank2.dat');
x=x1(1:100,:);
s=cov(x);

[gamma lambda]=eigs(s);

lambdamat=zeros(1:length(lambda),1:length(lambda));
for i=1:6
    lambdamat(i,i)=1./sqrt(lambda(i,i));
end

s2=gamma*lambdamat*gamma';
m=mean(x);
for i=1:length(x)
    for j=1:6
        x(i,j)=x(i,j)-m(j);
    end
end

%Mahalanobis Transformation
z=x*s2;

disp('Mean of Z');
mean(z)
disp('Empirical Covarance of Z')
cov(z)

