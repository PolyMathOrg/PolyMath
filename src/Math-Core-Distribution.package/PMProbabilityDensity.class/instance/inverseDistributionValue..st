information
inverseDistributionValue: aNumber
	"Answer the number whose distribution value is aNumber.
	 NOTE: Subclass MUST NOT overwrite this method."
	^(aNumber between: 0 and: 1)
			ifTrue: [ self privateInverseDistributionValue: aNumber]
			ifFalse:[ self error: 'Illegal argument for inverse distribution value']