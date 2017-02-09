initialization
privateInverseDistributionValue: aNumber
		"Private"
	^( (1 - aNumber) ln negated raisedTo: ( 1 / alpha)) * beta