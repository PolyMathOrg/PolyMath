I implement Globally Convergent Newton Method to solve scalar nonlinear equations f(x)=0.

As Newton step (especially started far from actual root) may lead to divergence, I use Line Search (DhbLineSearch) to extend the convergence region.

Each iteration of the method finds next approximation according to the formula:

x(new) = x(old) + step; step = - f(x) / f'(x)

step might be adjusted by line search.

Usage

         (DhbNewtonZeroFinder function: funBlock derivaitve: derBlock) initValue: x0; evaluate.

Or

         (DhbNewtonZeroFinder function: funBlock) initValue: x0; evaluate.

If derivative is not provided, it will be approximated, but this leads to very inefficient process!