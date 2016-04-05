information
indexOfOuterPoint
		"Private"
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