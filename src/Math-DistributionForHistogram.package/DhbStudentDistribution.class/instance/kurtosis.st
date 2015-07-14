information
kurtosis
		"Answer the kurtosis of the receiver.
		 Undefined if the degree of freedom is less than 5.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 16/2/99 "
	^degreeOfFreedom > 4 ifTrue: [ 6 / ( degreeOfFreedom - 4)]
						 ifFalse:[ nil]