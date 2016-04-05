information
randomIndex: aNumberArray
		"Private"
	| x n |
	x := Number random.
	n := 1.
	aNumberArray do: 
		[ :each |
		  x < each
			ifTrue: [ ^n].
		  n := n + 1.
		].
	 self error: 'should not be reached'.  "the original line was there because of a bug that should be taken care of now"