stream accessing
next
	^ randomNumberGenerator next < probability
		ifTrue: [ 1 ]
		ifFalse: [ 0 ]