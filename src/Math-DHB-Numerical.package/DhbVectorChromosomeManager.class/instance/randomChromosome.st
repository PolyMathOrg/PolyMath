creation
randomChromosome
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "
	^( ( 1 to: origin size) collect: [ :n | self randomComponent: n]) asVector