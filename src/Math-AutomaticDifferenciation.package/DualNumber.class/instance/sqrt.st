mathematical functions
sqrt
	| d |
	d := 2 * value sqrt.
	d = 0
		ifTrue: [ d := self class zeroApproximation ].
	^ self class value: value sqrt eps: eps / d