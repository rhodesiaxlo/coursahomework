function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%


% X 400*1
% Theta1 25 * 401
% Theta2 10 * 26

a1 = X'; % 400*5000
a1 = [ones(1, size(a1,2)); a1];
a2 = sigmoid(Theta1*a1);
a2 = [ones(1, size(a2,2)); a2];
a3 = sigmoid(Theta2*a2);

% 下面这句是错误的, sigmoid 是建立在概率的基础之上的,所以没有严格的数值区分
% 在 one-vs-all 的情形下,判断输入到那个 category 应该使用相对最大值,而不是 0.5 threadhold
% a3 = a3>0.5; % 10 * 5000

[dummp p] = max(a3, [], 1);
p = p';


% =========================================================================


end
