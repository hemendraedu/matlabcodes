% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAnpcausco2i
% ---------------------------------------------------------------------
% Description:  MVAnpcausco2i shows a screeplot of the eigenvalues for 
%               the PCA of the standardized US company data 
%               ("uscomp2.dat"). It computes the correlations between 
%               the variables and the principal components and displays 
%               the first two of them. 
% ---------------------------------------------------------------------
% Usage:        MVAnpcausco2i
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Screeplot of the eigenvalues for the PCA of the 
%               standardized US company data ("uscomp2.dat"). 
%               It computes the correlations between the variables and 
%               the principal components and displays the first two of 
%               them. 
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Jorge Patron, Vladimir Georgescu, 
%               Song Song
% ---------------------------------------------------------------------

% Note: Eigenvalues and Eigenvectors calculated in this function differ to the ones in the
%       MVA book. This is because Matlab decomposes matrixes in a different manner.
%       However, this should not change the analysis in any meaningful way. 

[Company,A,S,MV,P,CF,E,Sector]=textread('uscomp2.dat','%s %f %f %f %f %f %f %s');

x=horzcat(A,S,MV,P,CF,E);
x=vertcat(x(1:37,:),x(39,:),x(41:79,:));
[n p]=size(x);
m=mean(x);
x=(x-repmat(m,n,1)).*repmat(1./sqrt((n-1)*var(x)/n),n,1);        % Standardizes the data matrix
[v e]=eigs((n-1)*cov(x)/n,p,'la');                               % Eigenvalues sorted by size from largest to smallest(Note: Command generates a Warning(Disregard it)) 
e1=(e*ones(p,1))';                                               % Creates column vector of eigenvalues
x=x-repmat(m,n,1);
r=x*v;
r(:,7:12)=x(:,1:6);
r=corr(r);                                                       % Correlation between PCs and variables
r1(:,1)=r(7:12,1);                                               % Correlation of the two most important PCs and variables
r1(:,2)=r(7:12,2);                                               % Multiply here the second PC by -1 for the same output as in the MVA book

%Eigenvalues
nr=1:6;
figure(2)
scatter(nr,e1,'k')
xlabel('Index')
ylabel('Lambda')
title('U.S. Company Data')
xlim([0.5 6.5])
ylim([-0.2 3.5])

%Polar coordinates
figure(1)
hold on
xlim([-1.2 1.2])
ylim([-1.2 1.2])
line([-1.2 1.2],[0 0],'Color','k')
line([0 0],[1.2 -1.2],'Color','k')
title('U.S. Company Data')
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





