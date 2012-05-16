information
maximumCount
		"Answer the maximum count of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 17/2/99 "
	self isCached
		ifTrue: [ self flushCache].
	^contents inject: ( contents isEmpty ifTrue: [ 1] ifFalse:[ contents at: 1])
					into: [ :max :each | max max: each]