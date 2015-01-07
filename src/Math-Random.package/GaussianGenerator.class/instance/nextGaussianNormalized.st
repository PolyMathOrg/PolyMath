accessing
nextGaussianNormalized
	| x1 x2 w y1 y2 |
	self hasNextGaussian
		ifTrue: [ 
			[^ nextGaussian] ensure: [ nextGaussian := nil ] ].
	[ 
	x1 := 2.0 * rng nextFloat - 1.0.
	x2 := 2.0 * rng nextFloat - 1.0.
	w := x1 * x1 + (x2 * x2).
	w >= 1.0 ] whileTrue.
	w := (-2.0 * w ln / w) sqrt.
	y1 := x1 * w.
	y2 := x2 * w.
	nextGaussian := y2.
	^ y1