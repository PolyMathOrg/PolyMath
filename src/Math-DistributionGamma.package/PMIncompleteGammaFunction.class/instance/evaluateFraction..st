private
evaluateFraction: aNumber 

	fraction isNil 
		ifTrue: 
			[fraction := PMIncompleteGammaFractionTermServer new.
			fraction setParameter: alpha].
	fraction setArgument: aNumber.
	^(PMContinuedFraction server: fraction)
		desiredPrecision: PMFloatingPointMachine new defaultNumericalPrecision;
		evaluate