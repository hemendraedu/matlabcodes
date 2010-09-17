% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAcontbank2
% ---------------------------------------------------------------------
% Description:  MVAcontbank2 computes a kernel density estimate of 
%               variables  X5 and X6 of the Swiss bank notes 
%               ("bank2.dat"). The bandwidth parameter are chosen by 
%               Scott's rule of thumb.
% ---------------------------------------------------------------------
% Usage:        MVAcontbank2
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Kernel density estimate of variables  X5 and X6 of the 
%               Swiss bank notes ("bank2.dat").
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Jorge Patron,
%               Song Song
% ---------------------------------------------------------------------

%The contours are implemented using a Gaussian Kernel. To make it similar
%to XploRe, a Quartic Kernel needs to be implemented.

xx=load('bank2.dat');

x=[xx(:,5) xx(:,6)];

m=mean(x);
x(:,1)=x(:,1)/m(1);
x(:,2)=x(:,2)/m(2);

nL=length(x(:,1));
if nargin<=2
 [h(1)]=bandwidth_SJ(x(:,1),'norm');
 [h(2)]=bandwidth_SJ(x(:,2),'norm');
end
if nargin<=3
    Xrange=min(x(:,1)):(max(x(:,1))-min(x(:,1)))/29:max(x(:,1));
    Yrange=min(x(:,2)):(max(x(:,2))-min(x(:,2)))/29:max(x(:,2));
end
nX=length(Xrange);
nY=length(Yrange);
for ix=1:nX
    for iy=1:nY
        u1=(Xrange(ix)-x(:,1))/h(1);
        u2=(Xrange(iy)-x(:,2))/h(2);
        u=[u1,u2]';
        for is=1:nL
              Kd_u(is)=1/(2*pi)*exp(-1/2*u(:,is)'*u(:,is));
        end
        fx(ix,iy)=mean(Kd_u)/prod(h);
    end
end
Xrange=Xrange*m(1);
Yrange=Yrange*m(2);
contour(Xrange,Yrange,fx,10);
hold on
plot(x)
x
xlim([10.3 11]);
ylim([139 142.5]);
xlabel('X');
ylabel('Y');
hold off
