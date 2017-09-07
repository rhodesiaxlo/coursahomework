function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


hypothesis = sigmoid(X*theta);
J = -y.*log(hypothesis)-(1-y).*log(1-hypothesis);
J = sum(J)/m;
regTerm = lambda*sum(theta(2:end).^2)./(2*m);

J = J + regTerm;

% 因为 J 为负数,所以 grad 要 +
grad = grad + (sum((hypothesis-y).*X)/m)';

gradRegTerm = lambda*[ zeros(1,1);theta(2:end,:)]./m;

grad = grad + gradRegTerm;



% =============================================================

end
