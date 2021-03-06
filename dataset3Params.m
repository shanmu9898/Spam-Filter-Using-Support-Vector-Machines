function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%  

%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
x = [0.01;0.03;0.1;0.3;1;3;10;30];
min = 10000000;
for i = 1:8
	for j = 1 : 8
		 cc = x(i);
		 %disp('the value of cc is'),disp(cc)
		 ss = x(j);
		 %disp('the value of ss is'),disp(ss)
		 model= svmTrain(X, y, cc, @(x1, x2) gaussianKernel(x1, x2, ss));
		 predictions = svmPredict(model, Xval); 
         value =  mean(double(predictions ~= yval));
         %disp('the value of min and value is'),disp(min),disp(value)
         if(value < min)
         	min = value;
         	C = cc;
         	sigma = ss;
          %  disp('the value of C and sigma is'),disp(C),disp(sigma)	
         endif
    endfor
endfor         









% =========================================================================

end
