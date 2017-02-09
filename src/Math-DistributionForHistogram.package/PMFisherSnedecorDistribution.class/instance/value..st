information
value: aNumber
	"Answers the probability that a random variable distributed according to the receiver gives a value between aNumber and aNumber + espilon (infinitesimal interval)."
	^aNumber > 0
		ifTrue: [ ( norm + ( aNumber ln * ( dof1 / 2 - 1) ) - ( (aNumber * dof1 + dof2) ln * ( ( dof1 + dof2) / 2))) exp]
		ifFalse:[ 0]