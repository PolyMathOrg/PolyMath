transformation
split
		"Private - Answers an array of 4 matrices split from the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 8/5/99 "
	| n m n1 m1 |
	n := self numberOfRows.
	m := self numberOfColumns.
	n1 := self largestPowerOf2SmallerThan: n.
	m1 := self largestPowerOf2SmallerThan: m.
	^Array
		with: ( self class rows: ( ( 1 to: n1) asVector collect: [ :k | ( rows at: k) copyFrom: 1 to: m1]))
		with:( self class rows: ( ( 1 to: n1) asVector collect: [ :k | ( rows at: k) copyFrom: (m1 + 1) to: m]))
		with: ( self class rows: ( ( (n1 + 1) to: n) asVector collect: [ :k | ( rows at: k) copyFrom: 1 to: m1]))
		with:( self class rows: ( ( (n1 + 1) to: n) asVector collect: [ :k | ( rows at: k) copyFrom: (m1 + 1) to: m]))