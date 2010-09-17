%
% Three-Way Tables: drug example
%
drug; %read data
y=zi(:,10);
% design matrix
I=2
J=2
K=5
X=[
    1   1   1  0  0  0   
    1   1   0  1  0  0   
    1   1   0  0  1  0   
    1   1   0  0  0  1   
    1   1  -1 -1 -1 -1   
    1  -1   1  0  0  0   
    1  -1   0  1  0  0   
    1  -1   0  0  1  0   
    1  -1   0  0  0  1   
    1  -1  -1 -1 -1 -1 
   -1   1   1  0  0  0   
   -1   1   0  1  0  0   
   -1   1   0  0  1  0   
   -1   1   0  0  0  1   
   -1   1  -1 -1 -1 -1 
   -1  -1   1  0  0  0   
   -1  -1   0  1  0  0   
   -1  -1   0  0  1  0   
   -1  -1   0  0  0  1   
   -1  -1  -1 -1 -1 -1  
];
[n,p]=size(X);
%
%  First order interactions
%
X=[X  X(:,1).*X(:,2) ...
      X(:,1).*X(:,3) ...
      X(:,1).*X(:,4) ...
      X(:,1).*X(:,5) ...
      X(:,1).*X(:,6) ...
      X(:,2).*X(:,3) ...
      X(:,2).*X(:,4) ...
      X(:,2).*X(:,5) ...
      X(:,2).*X(:,6) ];
%
%  second order interactions
%
%X=[X  X(:,1).*X(:,2).*X(:,3) ...
      %X(:,1).*X(:,2).*X(:,4) ...
      %X(:,1).*X(:,2).*X(:,5) ...
      %X(:,1).*X(:,2).*X(:,6)];
%
% Constant term
%
X=[ones(n,1)  X];
%
[n,npar]=size(X);
df=n-npar;
%
Xform=[];
for i=1:n
   temp=sprintf('%3.0f',X(i,:));
   Xform=[Xform;temp];
end
%
b0=regress(log(y),X)
loglik=sum((X*b0).*y)
[npar,qpr]=size(b0)
iter=500;
opt=[1 1e-2 1e-2 1e-4  0 0 0 0 0 0 0 0 0 iter 0 0 0 1];
tic
b=constr('loglin',b0,[],[],[],[],y,X) 
loglik=sum((X*b).*y)
toc
lnyfit=X*b;
yfit=exp(lnyfit);
e=log(y)-lnyfit;
disp('degree of freedom')
disp(df)
G2=2*sum(y.*e)
pvalG2 =1- chi2cdf(G2,df)
X2=sum(((y-yfit).^2)./yfit)
pvalG2 =1- chi2cdf(G2,df)
disp(' ')
disp('  observed    fitted')
disp('    values    values')
disp([y  yfit])
disp(' ')
%disp('design matrix')
%disp(Xform)
