%  Data from PSY 2031
y=[18 15 15 20 25 30 5 8 8 10 12 10 14 20 25]'
X=[
1  1 0  1  1  0 
1  1 0  1  1  0 
1  1 0 -1 -1  0 
1  1 0 -1 -1  0 
1  1 0 -1 -1  0 
1  1 0 -1 -1  0 
1  0 1  1  0  1 
1  0 1  1  0  1 
1  0 1  1  0  1 
1  0 1 -1  0 -1 
1  0 1 -1  0 -1 
1 -1 -1 1 -1 -1 
1 -1 -1 1 -1 -1 
1 -1 -1 -1 1  1 
1 -1 -1 -1 1  1];

X1=X(:,1:1);
c=X'*X
ci=inv(c);
c1=X1'*X1
b=inv(c)*X'*y
b1=inv(c1)*X1'*y
rss=(y-X*b)'*(y-X*b)
rss1=(y-X1*b1)'*(y-X1*b1)
% Global TEST
[n,pp]=size(X)
p=pp-1;
A=[zeros(p,1)  eye(p)]
a=zeros(p,1)
bnot=b-ci*A'*inv(A*ci*A')*(A*b-a)
rssnot=(y-X*bnot)'*(y-X*bnot)
f=n-pp
r=f+rank(A)
F=((rssnot-rss)/(r-f))/(rss/f)
pval =1- FCDF(F,r-f,f)
% individual tests
A=[0 1 0 0 0 0]
a=0
bnot=b-ci*A'*inv(A*ci*A')*(A*b-a)
rssnot=(y-X*bnot)'*(y-X*bnot)
f=n-pp
r=f+rank(A)
F=((rssnot-rss)/(r-f))/(rss/f)
pval =1- FCDF(F,r-f,f) 
A=[0 1 0 0 0 0]
a=0
bnot=b-ci*A'*inv(A*ci*A')*(A*b-a)
rssnot=(y-X*bnot)'*(y-X*bnot)
f=n-pp
r=f+rank(A)
F=((rssnot-rss)/(r-f))/(rss/f)
pval =1- FCDF(F,r-f,f) 

A=[0 0 1 0 0 0]
a=0
bnot=b-ci*A'*inv(A*ci*A')*(A*b-a)
rssnot=(y-X*bnot)'*(y-X*bnot)
f=n-pp
r=f+rank(A)
F=((rssnot-rss)/(r-f))/(rss/f)
pval =1- FCDF(F,r-f,f) 


A=[0 0 0 1 0 0]
a=0
bnot=b-ci*A'*inv(A*ci*A')*(A*b-a)
rssnot=(y-X*bnot)'*(y-X*bnot)
f=n-pp
r=f+rank(A)
F=((rssnot-rss)/(r-f))/(rss/f)
pval =1- FCDF(F,r-f,f) 

A=[0 0 0 0 1 0]
a=0
bnot=b-ci*A'*inv(A*ci*A')*(A*b-a)
rssnot=(y-X*bnot)'*(y-X*bnot)
f=n-pp
r=f+rank(A)
F=((rssnot-rss)/(r-f))/(rss/f)
pval =1- FCDF(F,r-f,f) 

A=[0 0 0 0 0 1]
a=0
bnot=b-ci*A'*inv(A*ci*A')*(A*b-a)
rssnot=(y-X*bnot)'*(y-X*bnot)
f=n-pp
r=f+rank(A)
F=((rssnot-rss)/(r-f))/(rss/f)
pval =1- FCDF(F,r-f,f) 

% global test for interaction
A=[0 0 0 0 1 0
   0 0 0 0 0 1]
a=[0 0]'
bnot=b-ci*A'*inv(A*ci*A')*(A*b-a)
rssnot=(y-X*bnot)'*(y-X*bnot)
f=n-pp
r=f+rank(A)
F=((rssnot-rss)/(r-f))/(rss/f)
pval =1- FCDF(F,r-f,f) 


