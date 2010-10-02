% Example 5.3 - Constructing a confidence ellipse for mean vector mu
load example_5_3;

% transform X1, X2 to near normality 
X1_t = X1.^(1/4);
X2_t = X2.^(1/4);

% put X1_t, X2_t into a matrix X
X = [X1_t, X2_t];

% store number of observations in n and number of features/variables in p
[n,p] = size(X);

% compute sample mean vector and sample covariance matrix 
X_bar = mean(X)';
S = cov(X);
S_inv = inv(S);

% eigen-vectors store in V, eigen values stores in diag(D)
[V D] = eig(S);

% compute 95% confidence region
c_sq = (p*(n-1)/(n-p)) * finv(.95,p,n-p);

% Calculate T_sq to see mu0 = [.562, .589 ]' is in the confidence region?
mu0 = [.562, .589 ]';
T_sq = n*(X_bar-mu0)'*S_inv*(X_bar-mu0);

% As T_sq <= c_sq, we conclude [.562, .589 ]' is in the region

