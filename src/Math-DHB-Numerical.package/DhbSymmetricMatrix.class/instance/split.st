transformation
split
	"Private - 
	Answers an array of 3 matrices split from the receiver. 
	(c) Copyrights Didier BESSET, 1999, all rights reserved. 
	Initial code: 11/2/99"

	| n |
	n := self largestPowerOf2SmallerThan: rows size.
	^Array
		with: (self class rows: ((1 to: n) asVector collect: [:k | (rows at: k)
						copyFrom: 1 to: n]))
		with: (self class rows: ((n + 1 to: rows size) asVector collect: [:k | (rows at: k)
						copyFrom: n + 1 to: rows size]))
		with: (self class superclass rows: ((n + 1 to: rows size) asVector collect: [:k | (rows at: k)
						copyFrom: 1 to: n]))