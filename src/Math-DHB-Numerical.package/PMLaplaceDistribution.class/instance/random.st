information
random
	"Answer a random number distributed accroding to the receiver."
	| r |
	r := flatGenerator floatValue ln * beta negated.
	^ flatGenerator floatValue > 0.5
		ifTrue: [ mu + r]
		ifFalse:[ mu - r]