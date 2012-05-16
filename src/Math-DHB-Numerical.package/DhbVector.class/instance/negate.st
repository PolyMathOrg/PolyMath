transformation
negate
		"Inverse the sign of all components of the receiver.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 11/2/99 "
	1 to: self size do: [ :n | self at: n put: (self at: n) negated].