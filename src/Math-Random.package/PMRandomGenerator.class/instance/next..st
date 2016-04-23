stream access
next: anInteger
	"Answer a collection of size anInteger of pseudo-random Floats between 0 and 1. "

	^ ( 1 to: anInteger ) collect: [ :i | self next ]
