A MarsagliaKissRandom is a pseudo-random number generator (PRNG) using Marsaglia's Keep it Simple Stupid algorithm.

It generates Float with uniform distribution in Interval [0,1).
The result divided by 1.0 predecessor will be in [0,1].

Instance Variables
	kernelRand1:		<MarsagliaKissRandomKernel> a first generator
	kernelRand2:		<MarsagliaKissRandomKernel> a second generator
