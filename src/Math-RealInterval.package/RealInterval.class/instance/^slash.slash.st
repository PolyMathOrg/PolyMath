arithmetic
// anInt
	"Integer quotient defined by division with truncation toward negative 
	infinity.  \\ answers the remainder 
	from this division."
	"this is Pharos definition and the implementation of course follows
	this definition, but i wonder a bit whether it wouldnt be better for
	the interval definition to assume that the integer quotient is only
	defined on integers?"
	^(self / anInt) floor