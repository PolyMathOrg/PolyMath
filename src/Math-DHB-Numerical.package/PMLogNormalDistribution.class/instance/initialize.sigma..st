initialization
initialize: aNumber1 sigma: aNumber2
		"Private - Defines the parameters of the receiver."
	normalDistribution := PMNormalDistribution new: aNumber1 sigma: aNumber2.
	^self