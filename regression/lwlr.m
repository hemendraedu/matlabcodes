% Original Andrew Ng. et all - Stanford University

% lwlr function takes as input:
%    a) the training set (X,y matrices)
%    b) a new query point x and 
%    c) the weight bandwitdh tau.
% The function does 3 things. 
%    1) compute weights w(i) for each training example, 
%    2) maximize ?(?) using Newton?s method, 
%    3) output y = 1{h?(x) > 0.5} as the prediction.

function y = lwlr(X, y, x, tau)

    m = size(X,1);
    n = size(X,2);
    theta = zeros(n,1);

    % compute weight vector w
    w = exp(-sum((X - repmat(x', m, 1)).^2, 2) / (2*tau));

    % perform Newton's method
    g = ones(n,1);
    while (norm(g) > 1e-6)
      h = 1 ./ (1 + exp(-X * theta));
      g = X' * (w.*(y - h)) - 1e-4*theta;
      H = -X' * diag(w.*h.*(1-h)) * X - 1e-4*eye(n);
      theta = theta - H \ g;
    end

    % return predicted y
    y = double(x'*theta > 0);
