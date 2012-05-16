information
evaluateInverseFraction: aNumber 
	"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 10/3/99 "

	inverseFraction isNil 
		ifTrue: 
			[inverseFraction := DhbIncompleteBetaFractionTermServer new.
			inverseFraction setParameter: alpha2 second: alpha1].
	inverseFraction setArgument: (1 - aNumber).
	^(DhbContinuedFraction server: inverseFraction)
		desiredPrecision: DhbFloatingPointMachine new defaultNumericalPrecision;
		evaluate