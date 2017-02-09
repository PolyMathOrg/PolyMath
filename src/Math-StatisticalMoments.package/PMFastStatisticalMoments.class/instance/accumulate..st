transformation
accumulate: aNumber 
	"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 17/6/99 "

	| var |
	var := 1.
	1 to: moments size
		do: 
			[:n | 
			moments at: n put: (moments at: n) + var.
			var := var * aNumber]