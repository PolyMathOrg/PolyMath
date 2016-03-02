information
variance
	"Answer the variance of the receiver. Undefined if the degree of freedom is less than 3."
	^degreeOfFreedom > 2 
		ifTrue: [ degreeOfFreedom / ( degreeOfFreedom - 2)]
		ifFalse:[ nil]