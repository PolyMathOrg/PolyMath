initialization
initialize: anInteger
	"Private "
	average := DhbVector new: anInteger.
	self reset.
	^ self