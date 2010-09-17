% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAnpcahousi
% ---------------------------------------------------------------------
% Description:  MVAnpcahousi performs a PCA for the standarized Boston 
%               housing data ("bostonh.dat"). It shows the first two 
%               principal components and a screeplot of the 
%               eigenvalues.
% ---------------------------------------------------------------------
% Usage:        MVAnpcahousi
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       PCA for the standarized Boston housing data 
%               ("bostonh.dat"). It shows the first two principal 
%               components and a screeplot of the eigenvalues.
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Jorge Patron,
%               Song Song
% ---------------------------------------------------------------------

x=load('bostonh.dat');

%Transformations
xt=x;
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

x1(:,1:3)=xt(:,1:3);
x1(:,4:13)=xt(:,5:14);

n=length(x1);
m=mean(x1);
for i=1:13
    x1(:,i)=x1(:,i)-m(i);
end
b = sqrt((n-1)*var(x1)/n);

for i=1:13
    x1(:,i)=x1(:,i)./b(i);
end

adjust=(n-1)*cov(x1)/n;

[v e]=eig(adjust);
%Arranging eigenvalues and eigenvectors
for i=1:13
    e1(14-i)=e(i,i);
end

sorted(:,1)=v(:,13);
sorted(:,2)=-v(:,12);
sorted(:,3)=v(:,11);
sorted(:,4)=-v(:,10);
sorted(:,5)=-v(:,9);
sorted(:,6)=v(:,8);
sorted(:,7)=v(:,7);
sorted(:,8)=v(:,6);
sorted(:,9)=-v(:,5);
sorted(:,10)=v(:,4);
sorted(:,11)=-v(:,3);
sorted(:,12)=v(:,2);
sorted(:,13)=-v(:,1);

v=sorted;

m=mean(x1);
for i=1:13
    r1(:,i)=x1(:,i)-m(i);
end

r=r1*v;

for i=14:26
    r(:,i)=x1(:,i-13);
end

r=corr(r);

r12=r(13:24,1:2);                        
for i=13:24
    r13(:,1)=r(13:24,1);
    r13(:,2)=r(13:24,3);
end
for i=13:24
    r32(:,1)=r(13:24,3);
    r32(:,2)=r(13:24,2);
end       
r123=r(13:24,1:3);

%First and Second PC
subplot(2,2,1)
hold on
xlim([-1.2 1.2])
ylim([-1.2 1.2])
line([-1.2 1.2],[0 0],'Color','k')
line([0 0],[1.2 -1.2],'Color','k')
title('Boston Housing')
xlabel('First PC')
ylabel('Second PC')

circle = rsmak('circle');
fnplt(circle)

text(r12(1,1),r12(1,2),'X1','FontSize',8)
text(r12(2,1),r12(2,2),'X3','FontSize',8)
text(r12(3,1),r12(3,2),'X5','FontSize',8)
text(r12(4,1),r12(4,2),'X6','FontSize',8)
text(r12(5,1),r12(5,2),'X7','FontSize',8)
text(r12(6,1),r12(6,2),'X8','FontSize',8)
text(r12(7,1),r12(7,2),'X9','FontSize',8)
text(r12(8,1),r12(8,2),'X10','FontSize',8)
text(r12(9,1),r12(9,2),'X11','FontSize',8)
text(r12(10,1),r12(10,2),'X12','FontSize',8)
text(r12(11,1),r12(11,2),'X13','FontSize',8)
text(r12(12,1),r12(12,2),'X14','FontSize',8)

%Third and Second PC
subplot(2,2,2)
hold on
xlim([-1.2 1.2])
ylim([-1.2 1.2])
line([-1.2 1.2],[0 0],'Color','k')
line([0 0],[1.2 -1.2],'Color','k')
title('Boston Housing')
xlabel('Third PC')
ylabel('Second PC')

circle = rsmak('circle');
fnplt(circle)

text(r32(1,1),r32(1,2),'X1','FontSize',8)
text(r32(2,1),r32(2,2),'X3','FontSize',8)
text(r32(3,1),r32(3,2),'X5','FontSize',8)
text(r32(4,1),r32(4,2),'X6','FontSize',8)
text(r32(5,1),r32(5,2),'X7','FontSize',8)
text(r32(6,1),r32(6,2),'X8','FontSize',8)
text(r32(7,1),r32(7,2),'X9','FontSize',8)
text(r32(8,1),r32(8,2),'X10','FontSize',8)
text(r32(9,1),r32(9,2),'X11','FontSize',8)
text(r32(10,1),r32(10,2),'X12','FontSize',8)
text(r32(11,1),r32(11,2),'X13','FontSize',8)
text(r32(12,1),r32(12,2),'X14','FontSize',8)


%First and Third PC
subplot(2,2,3)
hold on
xlim([-1.2 1.2])
ylim([-1.2 1.2])
line([-1.2 1.2],[0 0],'Color','k')
line([0 0],[1.2 -1.2],'Color','k')
title('Boston Housing')
xlabel('First PC')
ylabel('Third PC')

circle = rsmak('circle');
fnplt(circle)

text(r13(1,1),r13(1,2),'X1','FontSize',8)
text(r13(2,1),r13(2,2),'X3','FontSize',8)
text(r13(3,1),r13(3,2),'X5','FontSize',8)
text(r13(4,1),r13(4,2),'X6','FontSize',8)
text(r13(5,1),r13(5,2),'X7','FontSize',8)
text(r13(6,1),r13(6,2),'X8','FontSize',8)
text(r13(7,1),r13(7,2),'X9','FontSize',8)
text(r13(8,1),r13(8,2),'X10','FontSize',8)
text(r13(9,1),r13(9,2),'X11','FontSize',8)
text(r13(10,1),r13(10,2),'X12','FontSize',8)
text(r13(11,1),r13(11,2),'X13','FontSize',8)
text(r13(12,1),r13(12,2),'X14','FontSize',8)

%First, Second and Third PC
subplot(2,2,4)
hold on
xlim([-1.2 1.2])
ylim([-1.2 1.2])
line([-1.2 1.2],[0 0],'Color','k')
line([0 0],[1.2 -1.2],'Color','k')
xlabel('X')
ylabel('Y')

circle = rsmak('circle');
fnplt(circle)

text(r123(1,1),r123(1,2),r123(1,3),'X1','FontSize',8)
text(r123(2,1),r123(2,2),r123(1,3),'X3','FontSize',8)
text(r123(3,1),r123(3,2),r123(3,3),'X5','FontSize',8)
text(r123(4,1),r123(4,2),r123(4,3),'X6','FontSize',8)
text(r123(5,1),r123(5,2),r123(5,3),'X7','FontSize',8)
text(r123(6,1),r123(6,2),r123(6,3),'X8','FontSize',8)
text(r123(7,1),r123(7,2),r123(7,3),'X9','FontSize',8)
text(r123(8,1),r123(8,2),r123(8,3),'X10','FontSize',8)
text(r123(9,1),r123(9,2),r123(9,3),'X11','FontSize',8)
text(r123(10,1),r123(10,2),r123(10,3),'X12','FontSize',8)
text(r123(11,1),r123(11,2),r123(11,3),'X13','FontSize',8)
text(r123(12,1),r123(12,2),r123(12,3),'X14','FontSize',8)

