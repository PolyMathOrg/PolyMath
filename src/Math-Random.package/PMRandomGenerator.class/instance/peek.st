stream access
peek
	"Answer a pseudo-Random number generated from the next seed,  but do not advance down the stream (i.e. self peek = self peek). "

	^ self subclassResponsibility