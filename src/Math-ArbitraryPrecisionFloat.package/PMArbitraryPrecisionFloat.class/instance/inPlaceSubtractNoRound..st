private
inPlaceSubtractNoRound: b 
	| delta |
	b isZero ifTrue: [^self].
	self isZero 
		ifTrue: 
			[mantissa := b mantissa negated.
			biasedExponent := b biasedExponent]
		ifFalse: 
			[delta := biasedExponent - b biasedExponent.
			delta isZero 
				ifTrue: [mantissa := mantissa - b mantissa]
				ifFalse: 
					[delta >= 0 
						ifTrue: 
							[mantissa := (self shift: mantissa by: delta) - b mantissa.
							biasedExponent := biasedExponent - delta]
						ifFalse: [mantissa := mantissa - (self shift: b mantissa by: delta negated)]]]