%
% Three-Way Tables: drug example, LOGISTIC MODEL
%  Effect on sex and age on drugs consumtion
%
drug; %read data
y=zi(:,10); % number of obs per cell
% design matrix
I=2; %  sex M - F
J=2; %  drug Yes - No
K=5; %  age category 16-29, 30-44, 45-64, 65-74, 75++
%
%  Mean age per group: for Men and for Women
%
average=[23.2 36.5 54.3 69.2 79.5 23.2 36.5 54.3 69.2 79.5]';

%
%   Design Matrix
%
X=[
    1   1    
    1   1  
    1   1 
    1   1      
    1   1     
    1  -1     
    1  -1      
    1  -1      
    1  -1      
    1  -1
    ];
%
%  Age and Age^2
%
X=[X  average  ...
     %average.*average 
];
%
[n,npar]=size(X);
df=n-npar;
%
Xform=[];
for i=1:n
   temp=sprintf('%10.2f',X(i,:));
   Xform=[Xform;temp];
end
%
%
label= zi(:,3)==1;
n1jk=y(label);
label= zi(:,3)==0;
n2jk=y(label);
b0=0*ones(npar,1);
%b0=[ -4.85  0.69  0.07  -0.0004]'
%b0=[-3.9  0.69 0.03]'
loglik=-lnliklogist(b0,n1jk,n2jk,X)
iter=100;
opt=[1 1e-2 1e-2 1e-4  0 0 0 0 0 0 0 0 0 iter 0 0 0 1];
tic
[b,OPTIONS]=fmins('lnliklogist',b0,[],[],n1jk,n2jk,X);
toc
b
loglik=-OPTIONS(8)
N=sum(y)
p1=ones(size(n1jk))./(ones(size(n1jk))+exp(-X*b));
p2=ones(size(n2jk))./(ones(size(n2jk))+exp(X*b));
nfit=[(n1jk+n2jk).*p1 ;  (n1jk+n2jk).*p2];
nobs=[n1jk ;n2jk];
e=log(nobs)-log(nfit);
disp('degree of freedom')
disp(df)
G2=2*sum(nobs.*e)
pvalG2 =1- chi2cdf(G2,df)
X2=sum(((nobs-nfit).^2)./nfit)
pvalG2 =1- chi2cdf(G2,df)
disp(' ')
disp('  observed    fitted')
disp('    values    values')
disp([nobs  nfit])
disp(' ')
disp('design matrix')
disp(Xform)
oddratfit=log(p1./p2);
oddrat=log(n1jk./n2jk);
plot(X(1:K,3),oddratfit(1:K),'-',X(K+1:2*K,3),oddratfit(K+1:2*K),'-',...
   X(1:K,3),oddrat(1:K),'*',X(K+1:2*K,3),oddrat(K+1:2*K),'o')
xlabel('Age category')
ylabel('log of odds-ratios')
