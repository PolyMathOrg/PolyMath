accessing
next
	^ rng next < p
		ifTrue: [ 1 ]
		ifFalse: [ 0 ]