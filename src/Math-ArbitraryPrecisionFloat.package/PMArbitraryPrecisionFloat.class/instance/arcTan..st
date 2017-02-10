mathematical functions
arcTan: denominator
	"Evaluate the four quadrant arc tangent of the argument denominator (x) and the receiver (y)."

	^self isZero
		ifTrue: [denominator sign positive
			ifTrue: [ (self + denominator) zero ]
			ifFalse: [ self positive
				ifTrue: [ (self + denominator) pi ]
				ifFalse: [ (self + denominator) pi negated ]]]
		ifFalse: [denominator isZero
			ifTrue: [self positive
				ifTrue: [ (self + denominator) pi timesTwoPower: -1 ]
				ifFalse: [ (self + denominator) pi negated timesTwoPower: -1 ]]
			ifFalse:
				[ | precision arcTan |
				precision := (self + denominator) numBits.
				arcTan := ((self asArbitraryPrecisionFloatNumBits: precision * 2) / (denominator asArbitraryPrecisionFloatNumBits: precision * 2)) arcTan.
				^(denominator > 0
					ifTrue: [ arcTan ]
					ifFalse: [ self > 0
						ifTrue: [ arcTan + arcTan pi ]
						ifFalse: [ arcTan - arcTan pi ]]) asArbitraryPrecisionFloatNumBits: precision]]