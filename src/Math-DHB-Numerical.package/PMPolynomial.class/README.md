A PMPolynomial represents a single variable polynomial function as an array of coefficients.

The constructor coefficients: anArray expects coefficients in increasing degree, that is constant term first. So, for example, to represent X^2 + 2X, we want to create:

PMPolynomial coefficients: #(0 2 1)

The printOn: method similarly displays the polynomial from lowest nonzero degree to highest. 

PMPolynomial coefficients: #(0 2 1)   2 X +  X^2 

