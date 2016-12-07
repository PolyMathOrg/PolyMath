I implement line search algorithm to find the minimum of a function g(x) >= 0 on the interval 0 < x < 1.
The method is initialized by g(0), g(1) and g'(0).
The step from x = 0 to x = 1 suppose to minimize g(x) (i.e. g'(0) < 0), but due to nonlinearity of g(x) might fail to do so.
In this case, this method finds such an x that this function is minimized in the sense:

g(x) <= g(0) + alpha g'(0)

for some small alpha (defaults to 1e-4).

Usage

For once off use: 

          (PMLineSearch function:  funBlock valueAtZero: g0  derivativeAtZero: dg0  valueAtOne: g1 ) evaluate.

where funBlock is the implementation of g(x), g0 = g(0), dg0 = g'(0) and g1 = g(0).

For repeated use:

            storedMethod := DhbLineSearch new.
           storedMethod setFunction: funBlock.
           storedMethod setValueAtZero: g0 derivativeAtZero: dg0  valueAtOne: g1.
           storedMethod evaluate. 
 
!!! Optimization tip!!!

It is guaranteed that g(x) will be called on the resulting x.

See DhbNewtonZeroFinder (PMNewtonZeroFinder) that uses this to minimize the number of function evaluations.