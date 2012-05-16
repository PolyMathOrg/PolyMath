initialization
initialize: anInteger
		"Private - Initialize the receiver to accumulate vectors of dimension anInteger.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 8/3/99 "
	covariance := ( ( 1 to: anInteger) collect: [ :n | DhbVector new: n]) asVector.
	^super initialize: anInteger