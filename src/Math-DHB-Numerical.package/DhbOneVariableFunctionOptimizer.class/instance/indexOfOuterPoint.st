information
indexOfOuterPoint
		"Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/22/00 "
	| inferior superior x |
	inferior := false.
	superior := false.
	x := bestPoints first position.
	2 to: 4 do:
		[ :n |
		  ( bestPoints at: n) position < x
				ifTrue: [ inferior
							ifTrue: [ ^n].
						  inferior := true.
						]
				ifFalse:[ superior
							ifTrue: [ ^n].
						  superior := true.
						].
		].