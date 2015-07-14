information
variance
		"Answer the variance of the receiver.
		 Undefined if the degree of freedom is less than 3.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	^degreeOfFreedom > 2 ifTrue: [ degreeOfFreedom / ( degreeOfFreedom - 2)]
						 ifFalse:[ nil]