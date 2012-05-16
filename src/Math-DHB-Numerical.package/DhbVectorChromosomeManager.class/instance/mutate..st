operation
mutate: aVector
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "
	| index |
	index := aVector size random + 1.
	^( aVector copy)
			at: index put: ( self randomComponent: index);
			yourself