operation
+ aVector
		"Answers the sum of the receiver with aVector.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	| answer n |
	answer := self class new: self size.
	n := 0.
	self with: aVector do:
		[ :a :b | 
		  n := n + 1. 
		  answer at: n put: ( a + b).
		].
	^answer