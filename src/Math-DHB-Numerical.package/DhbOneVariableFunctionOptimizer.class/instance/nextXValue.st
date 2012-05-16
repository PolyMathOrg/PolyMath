information
nextXValue
	"Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "
	| d3 d2 x1 |
	x1 := ( bestPoints at: 1) position.
	d2 := ( bestPoints at: 2) position - x1.
	d3 := ( bestPoints at: 3) position - x1.
	^( d3 abs > d2 abs ifTrue: [ d3]
					   ifFalse:[ d2]) * self class goldenSection + x1