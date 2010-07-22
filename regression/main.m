% Original Andrew Ng. et all - Stanford University

% Evaluate the classifier with a variety of different bandwidth parameters ? . 
% In particular, try ? = 0.01, 0.05, 0.1, 0.5, 1.0, 5.0.
% How does the classification boundary change when varying this parameter? 
% Can you predict what the decision boundary of ordinary
% (unweighted) logistic regression would look like?

% we should observe 
% For smaller ?, the classifier appears to overfit the data set, obtaining zero training error,
% but outputting a sporadic looking decision boundary. As ? grows, the resulting deci-
% sion boundary becomes smoother, eventually converging (in the limit as ? ? ? to the
% unweighted linear regression solution)

% debugging code with resolution = 50
test_lwlr(0.01,50);
test_lwlr(0.05,50);
test_lwlr(0.1,50);
test_lwlr(0.5,50);
test_lwlr(1.0,50);
test_lwlr(5.0,50);


% increase resolution to 500 to get a better idea of the decision boundary
test_lwlr(0.01,500);
test_lwlr(0.05,500);
test_lwlr(0.1,500);
test_lwlr(0.5,500);
test_lwlr(1.0,500);
test_lwlr(5.0,500);




 