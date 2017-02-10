mathematical functions
cosh
	"Answer receiver's hyperbolic cosine.
	Hyperbolic cosine is defined by same power serie expansion as for real numbers, that is in term of exponential:
	^ (self exp + self negated exp) / 2.
	This implementation avoids creating intermediate objects."
	
	^self class
		real: real cosh * imaginary cos
		imaginary: real sinh * imaginary sin