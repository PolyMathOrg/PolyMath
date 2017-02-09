transformation
sortEigenValues
		"Private - Use a bubble sort.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 1/6/99 "
	| n bound m |
	n := lowerRows size.
	bound := n.
	[ bound = 0 ]
		whileFalse: [ m := 0.
					  1 to: bound - 1 do:
						[ :j |
						  ( result at: j) abs > ( result at: j + 1) abs
							ifFalse:[ self exchangeAt: j.
									  m := j.
									].
						].
					  bound := m.
					].