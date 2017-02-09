information
inverseDistributionValue: aNumber
	"Private - Compute the value which corresponds to a integrated count of aNumber. NOTE: aNumber is assumed to be between 0 and 1."

	| count x integral |
	count := self count * aNumber.
	x := minimum.
	integral := 0.
	contents
		do: [ :each | 
			| delta |
			delta := count - integral.
			each > delta
				ifTrue: [ ^ binWidth * delta / each + x ].
			integral := integral + each.
			x := binWidth + x ].
	^ self maximum