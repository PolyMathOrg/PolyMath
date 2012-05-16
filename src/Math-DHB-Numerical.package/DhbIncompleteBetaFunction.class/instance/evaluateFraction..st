information
evaluateFraction: aNumber 
	"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 10/3/99 "

	fraction isNil 
		ifTrue: 
			[fraction := DhbIncompleteBetaFractionTermServer new.
			fraction setParameter: alpha1 second: alpha2].
	fraction setArgument: aNumber.
	^(DhbContinuedFraction server: fraction)
		desiredPrecision: DhbFloatingPointMachine new defaultNumericalPrecision;
		evaluate