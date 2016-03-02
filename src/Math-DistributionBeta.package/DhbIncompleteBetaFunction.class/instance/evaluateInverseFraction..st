private
evaluateInverseFraction: aNumber 

	inverseFraction isNil 
		ifTrue: 
			[inverseFraction := DhbIncompleteBetaFractionTermServer new.
			inverseFraction setParameter: alpha2 second: alpha1].
	inverseFraction setArgument: (1 - aNumber).
	^(DhbContinuedFraction server: inverseFraction)
		desiredPrecision: DhbFloatingPointMachine new defaultNumericalPrecision;
		evaluate