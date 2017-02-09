information
kurtosis
	"Answer the kurtosis of the receiver. Undefined if the degree of freedom is less than 5."
	^degreeOfFreedom > 4 ifTrue: [ 6 / ( degreeOfFreedom - 4)]
						 ifFalse:[ nil]