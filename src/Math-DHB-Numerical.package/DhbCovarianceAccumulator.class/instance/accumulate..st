transformation
accumulate: anArray
		"Accumulate anArray into the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 8/3/99 "
	| delta count1 r|
	count1 := count.
	delta := super accumulate: anArray.
	r := count1 / count.
	1 to: delta size
		do: [ :n |
			  1 to: n do:
				  [ :m |
					( covariance at: n) at: m put: ( count1 * ( delta at: n) * ( delta at: m) + ( r * ( ( covariance at: n) at: m))).
				  ].
			].