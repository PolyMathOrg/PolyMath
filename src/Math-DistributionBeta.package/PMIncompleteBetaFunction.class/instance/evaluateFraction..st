private
evaluateFraction: aNumber 

	fraction isNil 
		ifTrue: 
			[fraction := PMIncompleteBetaFractionTermServer new.
			fraction setParameter: alpha1 second: alpha2].
	fraction setArgument: aNumber.
	^(PMContinuedFraction server: fraction)
		desiredPrecision: PMFloatingPointMachine new defaultNumericalPrecision;
		evaluate