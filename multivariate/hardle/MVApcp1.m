% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVApcp1
% ---------------------------------------------------------------------
% Description:  Computes parallel coordinates plots for car data.
% ---------------------------------------------------------------------
% Usage:        MVApcp1
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       parallel coordinates plots for car data.
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Ji Cao, Song Song, Vladimir Georgescu             
% ---------------------------------------------------------------------

load carc.txt
z=carc;
z
y=(z-(ones(74,1)*min(z)))./(ones(74,1)*(max(z)-min(z)+(max(z)==min(z))));

k=0;
l=0;
m=0;
for i=1:length(z)
    if z(i,13)==1
        k=k+1;
        us(k,:)=y(i,:);
    
    elseif z(i,13)==2
            l=l+1;
            japan(l,:)=y(i,:);
      
        elseif z(i,13)==3
                m=m+1;
                europe(m,:)=y(i,:);
    end
end
us
japan
europe
hold on
% plot(y','linewidth',1.5,'Color','r','LineStyle','-');
plot(us','linewidth',1,'Color','r','LineStyle',':');
plot(japan','linewidth',1,'Color','k','LineStyle','-');
plot(europe','linewidth',1,'Color','b','LineStyle','--');
        
length(y)
% parallelcoords(y,'Group',z(:,13), 'linewidth',1.5,'LineStyle','--')
% legend('hide')
% length(y)
title('Parallel Coordinate Plot (Car Data)')
hold off