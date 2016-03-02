private
evaluateFraction: aNumber 

	fraction isNil 
		ifTrue: 
			[fraction := DhbIncompleteGammaFractionTermServer new.
			fraction setParameter: alpha].
	fraction setArgument: aNumber.
	^(DhbContinuedFraction server: fraction)
		desiredPrecision: DhbFloatingPointMachine new defaultNumericalPrecision;
		evaluate