information
random
	"Answer a random number distributed accroding to the receiver."
	^( alpha > 1 ifTrue: [ self randomForLargeAlpha]
						ifFalse:[ self randomForSmallAlpha]) * beta