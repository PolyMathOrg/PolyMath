information
random
		"Answer a random number distributed accroding to the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	^( alpha > 1 ifTrue: [ self randomForLargeAlpha]
						ifFalse:[ self randomForSmallAlpha]) * beta