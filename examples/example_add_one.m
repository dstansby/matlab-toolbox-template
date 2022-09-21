%% Adding one to a number
%
% This example shows you how to add one to a number
a = 1;
b = mypackage.addOne(a);
b;

%% Adding one to a matrix
%
% As well as working on single numbers, it also works on matrices
A = zeros(2, 3);
B = mypackage.addOne(A);
B;
