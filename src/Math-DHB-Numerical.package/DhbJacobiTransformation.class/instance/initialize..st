initialization
initialize: aSymmetricMatrix
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 1/6/99 "
	| n m |
	n := aSymmetricMatrix numberOfRows.
	lowerRows := Array new: n.
	transform := Array new: n.
	1 to: n do:
		[ :k |
		  lowerRows at: k put: ( ( aSymmetricMatrix rowAt: k) copyFrom: 1 to: k).
		  transform at: k put: ( ( Array new: n) atAllPut: 0; at: k put: 1; yourself).
		].
	^self