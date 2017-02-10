arithmetic
timesTwoPower: n 
	^ self isZero
		ifTrue: [self]
		ifFalse: [self copy inPlaceTimesTwoPower: n]