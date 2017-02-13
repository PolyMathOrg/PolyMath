operation
scalarProduct: aVector
	
	| product n |
	n := 0.
	product := self collect: [ :each | n := n + 1. (aVector at: n) * each].
	n := product size.
	[ n > 1]
		whileTrue:[ | i j|
					i := 1.
					j := n.
					[ i < j]
						whileTrue: [ product at: i put: ( product at: i) + ( product at: j).
									 j := j - 1.
									 i := i + 1.
								   ].
					n := i min: j.
				  ].
	^product at: 1