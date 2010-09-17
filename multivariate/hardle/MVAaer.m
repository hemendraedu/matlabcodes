% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAaer
% ---------------------------------------------------------------------
% Description:  MVAaer calculates the actual error rate for swiss 
%               banknotes.
% ---------------------------------------------------------------------
% Usage:        MVAaer
%----------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Actual error rate for swiss banknotes.
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Vladimir Georgescu, Song Song
% ---------------------------------------------------------------------

x=load('bank2.dat');
xg1=x(1:100,:);
xf1=x(101:200,:);

i=0;
miss1=0;
miss2=0;
mf1=mean(xf1);
mg1=mean(xg1);
m1=(mf1+mg1)/2;

while i<100
    i=i+1;
    xg=x(1:99,:) ;
    mg=mean(xg);
    m=(mf1+mg)/2;
    s=(98*cov(xg)+99*cov(xf1))/197;
    alpha=inv(s)*(mg-mf1)';
    if i<100
        if ((x(i,:)-m)*alpha)<0
            miss1=miss1+1;
        end
    end
end

i=101;
while i<200
    i=i+1;
    xf=x(101:199,:);
    mf=mean(xf);
    m=(mf+mg1)/2;
    s=(98*cov(xg1)+99*cov(xf))/197;
    alpha=inv(s)*(mg1-mf)';
    if i<200
        if ((xf(i-100,:)-m)*alpha)>0
            miss2=miss2+1;
        end
    end
end

disp('Genuine banknotes classified as forged:')
miss1
disp('Forged banknotes classified as genuine:')
miss2
disp('AER (actual error rate):')
aer=(miss1+miss2)/length(x);
aer


