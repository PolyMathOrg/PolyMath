information
privateInverseDistributionValue: aNumber
		"Private - Answer the number whose acceptance is aNumber."
	^( peak - lowLimit) / ( highLimit - lowLimit) > aNumber
			ifTrue: [ self inverseAcceptanceBeforePeak: aNumber]
			ifFalse: [ self inverseAcceptanceAfterPeak: aNumber]