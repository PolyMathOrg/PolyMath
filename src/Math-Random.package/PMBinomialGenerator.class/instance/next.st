stream access
next
	| x |
	x := 0.
	numberOfTrials timesRepeat: [ randomNumberGenerator next <= probability ifTrue: [ x := x + 1 ] ].
	^ x