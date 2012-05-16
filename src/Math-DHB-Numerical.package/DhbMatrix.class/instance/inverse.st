operation
inverse
	"Answer the inverse of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "

	^self isSquare 
		ifTrue: [self lupInverse]
		ifFalse: [self squared inverse * self transpose]