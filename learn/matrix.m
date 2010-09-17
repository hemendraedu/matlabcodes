X = [42,4;52,5;48,4;58,3] % use comma or simple space between elements in a row and semicolon between rows;
X * eye(2)                % use * for matrix-matrix multiplication 
norm (X)                  % 2-norm of X
norm (X(:,2))             % L2 norm of a vector X2 
%norm (X,p)               % p-norm of a vector or matrix X
det(X'*X)                 % the determinant of a square matrix is det( X )
inv(X'*X)                 % the inverse of a non-singular matrix 
pinv(X)                   % Moore-Penrose pseudoinverse 
pinv(X)*X                 % equal eye(2)

S  = X'*X                 % S square 
S^2                       % a square matrix can be raised to a power p
sqrtm(S)                  % take s quare root of a matrix with sqrtm(M)
lambda = eig(S)           % return eigen-values
[E,D] = eig(S)            % eig() function with 2 output arguments give eigenvectors and diagonal matrix

%basic stat functions 
max(X)
min(X)
mean(X)
median(X)
std(X)                   % standard deviation function
cumsum(X)                % cummulative sum of elements
diff(X)                  % difference between successive elements
sort(X)                  % sort elements in ascending 


%useful for statistics 
cov(X)                  % give covariance of the data
corrcoef(X)             % compute correlation coefficient 

% clear variables and functions 
clear X                 % clear a specific variable 
clear functions         % clear all functions 
clear all               % clear all functions and variables

