%
%  This program plot a response surface in 3D
%
clear all
close all
%
x1=[-1:0.05:1]';[n1,p1]=size(x1);
x2=[-1:0.05:1]';[n2,p2]=size(x2);
b=[20 1 2 -8 -6  6]';
%
% y=b(1)+b(2)*x1 + b(3)*x2 + b(4)*x1.^2 + b(5)*x2.^2 + b(6)*x1.*x2;
%  
L=[];
for i=1:n1
   xi=x1(i);
   temp=[];
   for j=1:n2
      xj=x2(j);
      Lij=b(1)+b(2)*xi + b(3)*xj + b(4)*xi^2 + b(5)*xj^2 + b(6)*xi*xj;
      temp=[temp Lij];
   end
   L=[L;temp];
end
%
figure
mesh(x1,x2,L')
xlabel ('values of x1');ylabel('values of x2');zlabel('values of y')
figure
contour(x1,x2,L',20)
xlabel ('values of x1');ylabel('values of x2');zlabel('values of y')
figure
surf(x1,x2,L')
xlabel ('values of x1');ylabel('values of x2');zlabel('values of y')



