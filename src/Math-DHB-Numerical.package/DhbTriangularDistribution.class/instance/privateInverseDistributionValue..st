information
privateInverseDistributionValue: aNumber
		"Private - Answer the number whose acceptance is aNumber.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	^( peak - lowLimit) / ( highLimit - lowLimit) > aNumber
			ifTrue: [ self inverseAcceptanceBeforePeak: aNumber]
			ifFalse: [ self inverseAcceptanceAfterPeak: aNumber]