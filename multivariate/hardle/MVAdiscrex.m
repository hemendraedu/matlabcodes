% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAdiscrex
% ---------------------------------------------------------------------
% Description:  Simulates data from two normal populations with 
%               different mean and calculates the corresponding 
%               discriminant rule.
% ---------------------------------------------------------------------
% Usage:        MVAdiscrex
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Simulates data from two normal populations with 
%               different mean and calculates the corresponding 
%               discriminant rule.
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Song Song
% ---------------------------------------------------------------------

s=[100 0
    0 100];
s1=[10 0
    0 10];

x=normrnd(0,1,100,2);
for i=1:length(x)
    aux=x(i,:)*s1;    
    x(i,1)=aux(1)+77;
    x(i,2)=aux(2)+175;
end

y=normrnd(0,1,100,2);
for i=1:length(y)
    aux=y(i,:)*s1;    
    y(i,1)=aux(1)+58;
    y(i,2)=aux(2)+165;
end

m1=mean(x);
for i=1:2
    xx(:,i)=x(:,i)-m1(i);
end
m2=mean(y);
for i=1:2
    yy(:,i)=y(:,i)-m2(i);
end

sigma=cov([xx;yy]);

aux1=[x(:,1);y(:,1)];
aux2=[x(:,2);y(:,2)];
alpha=inv(sigma)*(m1'-m2');
mu=(m1+m2)/2;
y2=mu*alpha-alpha(1)*aux1;
y2=y2/alpha(2);

disc=[aux1,y2];

for i=1:length(y2)
    if and(or(y2(i)<max(aux2),y2(i)==max(aux2)),or(y2(i)>min(aux2),y2(i)==min(aux2)))
        cond(i)=1;
    else
        cond(i)=0;
    end
end

k=0;
for i=1:length(cond)
    if cond(i)>0
        k=k+1;
        result(k,:)=disc(i,:);
    end
end

hold on
title('Discrimination Rule');
xlabel('X');
ylabel('Y');
scatter(x(:,1),x(:,2));
scatter(y(:,1),y(:,2),'r','Marker','s');
line(result(:,1),result(:,2),'Color','g');
hold off



