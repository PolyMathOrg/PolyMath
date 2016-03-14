information
value: aNumber
		"Compute the value of the Lagrange interpolation polynomial on the receiver's points at aNumber.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	| norm dx products answer size |
	norm := 1.
	size := pointCollection size.
	products := Array new: size.
	products atAllPut: 1.
	1 to: size
		do: [ :n |
			  dx := aNumber - ( self xPointAt: n).
			  dx = 0
				ifTrue: [ ^( self yPointAt: n)].
			  norm := norm * dx.
			  1 to: size
				do: [ :m |
					  m = n
						ifFalse:[ products at: m put: ( (( self xPointAt: m) - ( self xPointAt: n)) * ( products at: m))].
					].
			].
	answer := 0.
	1 to: size do:
		[ :n | answer := ( self yPointAt: n) / ( ( products at: n) * ( aNumber - ( self xPointAt: n))) + answer].
	^norm * answer