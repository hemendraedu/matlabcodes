% Excercise 5.22- Constructing confidence intervals for data in table 5.13
clear all;
load T5-13.dat;

X = T5_13;

% n is number of observations,  p is number of features/variables
[n,p] = size(X);

% compute sample mean vector X_bar and sample covariance matrix S
X_bar = mean(X)';
S = cov(X);

% Construct Q-Q plots of the marginal distribution of fuel, repair and
% capital costs
normplot(X(:,1));
normplot(X(:,2));
normplot(X(:,3));

% Construct 3 possible scatter diagrams from pairs of observation on
% different variables
plotmatrix(X);
scatter(X(:,1),X(:,2), 'filled')
scatter(X(:,1),X(:,3), 'r', 'filled')
scatter(X(:,2),X(:,3), 'r','x')

% Find a list of suspect outliers in each column. 
% Here outlier is considered to be more than three standard deviations away
% from the mean.

% Create matrix of mean values by replicating the mean vector for n rows
MeanMat = repmat(mean(X),n,1);

% A matrix of std deviation values by replicating the std vector for n rows
SigmaMat = repmat(std(X),n,1);

% Create matrix of zeros and ones, ones indicate the location of outliers
outliers = abs(X - MeanMat) > 3*SigmaMat;

% Calculate the number of outliers in each column
nout = sum(outliers);

% remove observations 9, 21 because it appears to be outliers 
X(9,1) = NaN;
X(21,1) = NaN;

%Remove any rows containing NaNs from a matrix X.
X(any(isnan(X),2),:) = [];

% Can remove fater with 
% X(9,:) = [];
% X(21,:) = [];

% Sii is list containing all variances Xi, i = 1,2,...,p. 
Sii = diag(S);

% compute simultanoous T_square intervals at the level of 95% confidence
%t_square_int_weight = 9.9790;

t_square_int_weight = (p*(n-1)/(n-p)) * finv(.95,p,n-p);
t_square_intervals(:,1) = X_bar - sqrt(t_square_int_weight)*sqrt(Sii/n);
t_square_intervals(:,2) = X_bar + sqrt(t_square_int_weight)*sqrt(Sii/n);

% compute Bonfferoni intervals at the level of 95% confidence
%  bonfferoni_int_weight = 2.5736
bonfferoni_int_weight = tinv(1-0.05/(2*p), n-1); 
bonfferoni_intervals(:,1) = X_bar - bonfferoni_int_weight*sqrt(Sii/n);
bonfferoni_intervals(:,2) = X_bar + bonfferoni_int_weight*sqrt(Sii/n);

t_square_intervals
bonfferoni_intervals