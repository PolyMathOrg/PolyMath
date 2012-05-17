An ExponentialGenerator uses a uniform random variable in [0,1] to sample from an exponential distribution.

The exponential distribution has a single parameter beta, here denoted as mean. 

The default RandomGenerator is PMRandom, but can be modified.

The next method uses the formula:

x=  - \beta * ln (1 - u)

to generate an exponential sample x from a uniform [0,1] sample u.

(Applied Statistics 3rd ed., Ledolter and Hogg, p. 185)