operation
initializeIterations
	bestPoints size>=chromosomeManager populationSize 
		ifTrue: [bestPoints := bestPoints copyFrom: 1 to: (bestPoints size // 2 max: 1)].
	super initializeIterations.
	bestValueHistory:=OrderedCollection new.
	worstValueHistory:=OrderedCollection new.
	whateverHistory:=OrderedCollection new.
