transformation
accumulateNegated: aVectorOrAnArray
		"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 8/3/99 "
	1 to: self size do: [ :n | self at: n put: ( ( self at: n) - ( aVectorOrAnArray at: n))].