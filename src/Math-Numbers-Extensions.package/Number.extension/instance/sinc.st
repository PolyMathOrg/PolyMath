*Math-Numbers-Extensions-mathematical functions
sinc
	"Answer receivers cardinal sine."
	
	^ self isZero
		ifTrue: [self class one]
		ifFalse: [self sin / self]