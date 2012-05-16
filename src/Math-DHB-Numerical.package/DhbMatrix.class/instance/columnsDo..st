iterators
columnsDo: aBlock
		"Perform the collect: operation on the rows of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	| n |
	n := 0.
	^rows last do: [ :each | n := n + 1. aBlock value: ( self columnAt: n)]