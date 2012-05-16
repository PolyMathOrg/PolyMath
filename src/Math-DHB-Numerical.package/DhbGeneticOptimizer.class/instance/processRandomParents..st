operation
processRandomParents: aNumberArray
		"Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 23-Feb-00 "
	chromosomeManager process: ( bestPoints at: ( self randomIndex: aNumberArray)) position
						and:  ( bestPoints at: ( self randomIndex: aNumberArray)) position.