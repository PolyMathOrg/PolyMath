information
correlationCoefficient
		"Answers the correlation coefficient of the receiver."
	correlationCoefficient isNil
		ifTrue: [ self computeResults].
	^correlationCoefficient