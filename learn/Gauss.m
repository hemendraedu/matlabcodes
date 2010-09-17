function y = Gauss(x)

%GaussFunc computes a one-dimensional Gaussian 

%Gauss(x) returns the value at x of a normalized Gaussian centered on mu with std deviation sigma
mu = input('enter mean value');
sigma = input('enter the std deviation');
y = 1/(sqrt(2 * pi) * sigma)  * exp(-(x-mu)^2/(2*sigma^2));
