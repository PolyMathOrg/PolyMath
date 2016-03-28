I implement line search algorithm to find the minimum of a function g(x) >= 0 on the interval 0 < x < 1. The method is initialized by g(0), g(1) and g'(0). The step from x = 0 to x = 1 suppose to minimize g(x) (i.e. g'(0) < 0), but due to nonlinearity of g(x) might fail to do so. In this case, this method finds such an x that this function is minimized in the sense:

g(x) <= g(0) + alpha g'(0)

for some small alpha (defaults to 1e-4).