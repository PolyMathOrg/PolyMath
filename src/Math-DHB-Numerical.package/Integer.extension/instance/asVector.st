*Math-DHB-Numerical
asVector
	"Convert the receiver to a vector. 
	(c) Copyrights Didier BESSET, 1999, all rights reserved. 
	Initial code: 11/2/99"

	| aVector index |
	aVector := DhbVector new: self size.
	index := 0.
	self do: [:each | aVector at: (index := index + 1) put: each].
	^aVector