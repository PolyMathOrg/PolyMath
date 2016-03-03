A DhbLagrangeInterpolator takes a set of points (include each with #add:) and interpolates values using the Lagrange Interpolation Polynomial. This is the polynomial of minimum degree through all points in the pointCollection.

This is appropriate for interpolation only (interior to the region of the set of values), and sensitive to several conditions.

The method value: yields an approximation at a given value of the independent variable. Calculation is deferred until value is sent. If the set of points is fixed, NewtonInterpolator precomputes the value function. If the set of points is likely to change more often than interpolated values are needed, this is a fair choice.

(c) Copyrights Didier BESSET, 2000