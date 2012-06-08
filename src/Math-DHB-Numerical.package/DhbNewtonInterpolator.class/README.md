A DhbNewtonInterpolator is a specialized Lagrange Interpolator which precomputes the polynomial to be evaluated when interpolating. This is twice as expensive as direct evaluation, but produces a linear time (in the number of points) evaluation method for fixed points.

add: resets the coefficients

value: lazily initializes the coefficients and yields an interpolated value.

computeCoefficients and resetCoefficients should be considered private.