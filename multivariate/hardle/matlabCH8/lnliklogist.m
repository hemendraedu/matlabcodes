function f=lnliklogist(b,n1jk,n2jk,X)
%
% max likelihood in logistic models for 3-way contingency tables
% nijk is the effective in each cell, i=1,2
% Xi=design matrix for group i=1,2
% b is the current value of beta
%
%
p1=ones(size(n1jk))./(ones(size(n1jk))+exp(-X*b));
p2=ones(size(p1))-p1;
f=-sum(n1jk.*log(p1)) - sum(n2jk.*log(p2));