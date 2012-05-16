information
largestPowerOf2SmallerThan: anInteger
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved
		 Initial code: 21/3/99 "
	| m m2|
	m := 2.
	[ m2 := m * 2.
	  m2 < anInteger] whileTrue:[ m := m2].
	^m