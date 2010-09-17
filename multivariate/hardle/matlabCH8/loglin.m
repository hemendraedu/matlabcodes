function [f,g]=loglin(b,y,X)
%
% max likelihood in log-lin models
% y is the effective in each cell
% X*b is the expected value in cell if b is the current value
%
f=-sum((X*b).*y);
g=[sum(y-exp(X*b));sum(exp(X*b)-y)];