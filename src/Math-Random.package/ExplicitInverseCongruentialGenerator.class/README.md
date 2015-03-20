An ExplicitInverseCongruentialGenerator is an explicit inversive congruential generator, constructed according to "Good random number generators are (not so) easy to find" by P. Hellekalek (1998) and extended euclidean algorithm.
Developed by Konstantin Nizheradze <konsnizher@gmail.com> 

Instance Variables
	nextN:		<Object>
	nextValue:		<Object>
	p:		<Object>

nextN
	- next number of the sequence of random numbers. It is also the parameter at extended euclidean algorythm

nextValue
	- next modulo inverse value, calculated by extended euclidean algorythm

p
	- parameter at extended euclidean algorythm
