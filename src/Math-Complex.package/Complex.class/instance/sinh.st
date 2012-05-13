mathematical functions
sinh
	"Answer receiver's hyperbolic sine.
	Hyperbolic sine is defined by same power serie expansion as for real numbers, that is in term of exponential:
	^ (self exp - self negated exp) / 2.
	This implementation avoids creating intermediate objects."
	
	^self class
		real: real sinh * imaginary cos
		imaginary: real cosh * imaginary sin