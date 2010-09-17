function[]=MVAaperbh()
% ----------------------------------------------------------------------------
% EBook         mva
% ----------------------------------------------------------------------------
%   Quantlet     MVAaperbh
% ----------------------------------------------------------------------------
%   Description  MVAaper demonstrates ML discrimination rule and calculates
%                the apparent error rate for boston housing 
% ----------------------------------------------------------------------------
% 05.03.2007 Vladimir Georgescu

x=load('bostonh.dat');

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

for i=1:length(xt)
    if xt(i,14)>median(xt(:,14));
        true(i)=1;
    else
        true(i)=0;
    end
end

j=0;
k=0;
for i=1:length(xt)
    if true(i)==1 
        j=j+1;
        xg0(j,:)=xt(i,:);
    else
        k=k+1;
        xf0(k,:)=xt(i,:);
    end
end
a0=xg0(:,1:3);
b0=xg0(:,5:13);

a1=xf0(:,1:3);
b1=xf0(:,5:13);

xg=[a0,b0];
xf=[a1,b1];

mg=mean(xg);
mf=mean(xf);
m=(mf+mg)/2;

s=((length(xg)-1)*cov(xg)+(length(xf)-1)*cov(xf))/(length(xt)-2);

alpha=inv(s)*(mg-mf)';

miss1=0;
miss2=0;
corr1=0;
corr2=0;

for i=1:length(xg)
    aux1(i)=(xg(i,:)-m)*alpha;
end

for i=1:length(aux1)
    if aux1(i)<0 
        miss1=miss1+1;
    else
        corr1=corr1+1;
    end
end

for i=1:length(xf)
    aux2(i)=(xf(i,:)-m)*alpha;
end

for i=1:length(aux2)
    if aux2(i)>0 
        miss2=miss2+1;
    else
        corr2=corr2+1;
    end
end

disp('Group 1 classified as 2: ')
miss1
disp('Group 2 classified as 1: ')
miss2
disp('Group 1 classified as 1: ')
corr1
disp('Group 2 classified as 2:  ')
corr2
disp('APER (apparent error rate):')
aper=(miss1+miss2)/length(xt);
aper
          
 


