A DhbErfApproximation is a five term approximation to erf(x). This is a singleton class encapsulating the approximation. 

Use with 

DhbErfApproximation new value: aNumber

to receive erf(x). The result of the error function lies between zero and one.

An extension to Number exists, so the simpler use is

aNumber errorFunction 

which produces the same result.

If you need the error function as a function, you will need to enclose it in a block as:

| errorFunction |
errorFunction := [:x | x errorFunction].

Instance variables constant and series are part of the approximation formula. norm is a scale factor to make erf(infinity) = 1.

The error function is the Cumulative Distribution of the standard normal distribution. Thus, erf(x) represents the probability of a random variable with standard normal distribution being less than x. The approximation used is credited to Abramowitz and Stegun's Handbook of Mathematical Functions. The error function is detailed in Chapter 7. The implementation is detailed in Besset's book Section 2.3

Additional resources available from NIST Digital Library of Mathematics at:
http://dlmf.nist.gov/7