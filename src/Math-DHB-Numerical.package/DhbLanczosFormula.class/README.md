A DhbLanczosFormula is a singleton class which calculates an approximation to Gamma(x). 
Gamma function is a continuous extension to Factorial. Gamma(x + 1) = x * Gamma(x). For integers Gamma(n) = (n-1) factorial. 

This is called from Number>>gamma, and Number>>logGamma.

Instance variable coefficients contains the terms of the approximation.


The method is detailed in Numerical Recipes in C. The implementation is detailed in Besset's book Section 2.4
