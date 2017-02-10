private
floatClass
	"Answer the class suitable for doing floating point operations.
	In default Squeak, this is Float.
	In an image with single and double IEEE 754 floating point numbers,
	this would depend on the class of real and imaginary parts"

	^Float