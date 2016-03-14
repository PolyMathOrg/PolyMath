operation
mutate: aVector
		
	| index |
	index := aVector size random + 1.
	^( aVector copy)
			at: index put: ( self randomComponent: index);
			yourself