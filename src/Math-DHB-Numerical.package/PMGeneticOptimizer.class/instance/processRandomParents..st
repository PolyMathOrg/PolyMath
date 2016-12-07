operation
processRandomParents: aNumberArray
		"Private"
	chromosomeManager process: ( bestPoints at: ( self randomIndex: aNumberArray)) position
						and:  ( bestPoints at: ( self randomIndex: aNumberArray)) position