A MarsagliaKissRandomKernel is a private class for generating pseudo-Random numbers.

It generates 32-bits Integer with uniform distribution in Interval [ 0,16rFFFFFFFF].

It holds the states of the pseudo-random generator, and the kernel generation algorithm.
The algorithm is the one used in libgfortran library.
It is based on Marsaglia's Keep It Simple Stupid 2005 version as in "double precision RNGs" in  sci.math.num-analysis  
http://sci.tech-archive.net/Archive/sci.math.num-analysis/2005-11/msg00352.html

It is a combination of:
1) a linear congruential generator with period 2^32
2) a 3-shift shift-register generator of period 2^32-1
3) 2 16-bit multiply with carry generators with a period 597273182964842497 > 2^59

Period of this generator is about 2^123

Previous 1999 version can be found along with discussions in this sci.stat.math newsgroup archive:
http://www.ciphersbyritter.com/NEWS4/RANDC.HTM#369F6FCA.74C7C041@stat.fsu.edu
The shift-register had a permutation of first two shifts (13 and 17) leading to a reduced period.

Warning: this pseudo-random generator is not suitable for cryptography as it could be too easily broken (see http://eprint.iacr.org/2011/007.pdf)

Instance Variables
	jcong:	<Integer> state of the linear congruencial generator
	jsr:		<Integer> state of the 3-shift register generator
	w:		<Integer> state of the first multiply with carry generator
	z:		<Integer> state of the second multiply with carry generator
