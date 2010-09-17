% An M-file to draw a uni-variate Gaussian 

x = -4:0.1:4                        % creates a list of x values 
y = 1/sqrt(2 * pi)  * exp(-x.^2/2)  % compute coresponding y values
plot(x, y, '-')
title('Univariate Gaussian')
