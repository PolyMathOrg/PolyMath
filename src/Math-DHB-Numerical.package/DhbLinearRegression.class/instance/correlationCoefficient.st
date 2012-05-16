information
correlationCoefficient
		"Answers the correlation coefficient of the receiver
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/2/99 "
	correlationCoefficient isNil
		ifTrue: [ self computeResults].
	^correlationCoefficient