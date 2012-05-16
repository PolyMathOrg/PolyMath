information
inverseDistributionValue: aNumber
		"Answer the number whose distribution value is aNumber.
		 NOTE: Subclass MUST NOT overwrite this method.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	^( aNumber between: 0 and: 1)
			ifTrue: [ self privateInverseDistributionValue: aNumber]
			ifFalse:[ self error: 'Illegal argument for inverse distribution value']