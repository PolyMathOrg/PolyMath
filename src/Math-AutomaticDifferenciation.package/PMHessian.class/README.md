PMHessian calculates the hessian of a function of a SequentialCollection of Numbers as a PMSymmetricMatrix.  As a byproduct it also calculates the gradient.

Example: f(x,y)=x^2 * y
	h := PMHessian of:[:x|x first squared * x second].
	h value:#(3 2). "-->
	a PMVector(4 6)
	a PMVector(6 0) "
	h gradient ." -->#(12 9)"