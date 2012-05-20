information
randomIndex: aNumberArray
		"Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "
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