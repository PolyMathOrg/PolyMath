accessing
next
	| x |
	x := 0.
	n timesRepeat: [ rng next <= p ifTrue: [ x := x + 1 ] ].
	^ x