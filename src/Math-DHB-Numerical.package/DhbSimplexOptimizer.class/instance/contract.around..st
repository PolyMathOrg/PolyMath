operation
contract: aVector around: bestVector 
	"Private -
		 (c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 1/16/00 "

	bestPoints 
		add: (optimizingPointClass vector: bestVector * 0.5 + (aVector * 0.5)
				function: functionBlock)