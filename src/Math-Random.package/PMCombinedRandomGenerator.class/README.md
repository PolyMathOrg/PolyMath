This Combined Random Number Generator is based on the algorithm described by PIERRE L'ECUYER in "Efficient and Portable Combined Random Number Generators" [Communications of the ACM, June 19, Volume 31, Number 6, pp. 742-749, references p.774]. Taking into account its two-dimensional behaviour (from abovementioned article), this generator is suitable to produce the pairs of consecutive numbers.
For the first linear congruential generator (generator A):
m = 2147483563; a = 40014; q = 53668; r = 12211.
For the second linear congruential generator (generator B):
m = 2147483399; a = 40692; q = 52774; r = 3791.

To produce initial seedA (for the first generator)  the method #nextInt: 2147483562 of Random is used; to produce seedB (for the second)  - the method #nextInt: 2147483398. Corresponding seeds are represented as Floats. The result of work of two generators (the next seedA and seedB) are combined.

Developed by Konstantin Nizheradze <konsnizher@gmail.com> 

Instance Variables:
	random	<Random>
	seedA	<Number>
	seedB	<Number>