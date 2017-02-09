private
evaluateInverseFraction: aNumber 

	inverseFraction isNil 
		ifTrue: 
			[inverseFraction := PMIncompleteBetaFractionTermServer new.
			inverseFraction setParameter: alpha2 second: alpha1].
	inverseFraction setArgument: (1 - aNumber).
	^(PMContinuedFraction server: inverseFraction)
		desiredPrecision: PMFloatingPointMachine new defaultNumericalPrecision;
		evaluate