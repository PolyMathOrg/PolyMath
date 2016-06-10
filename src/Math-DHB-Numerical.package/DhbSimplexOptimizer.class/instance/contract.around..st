operation
contract: aVector around: bestVector 
	"Private"

	bestPoints 
		add: (optimizingPointClass vector: bestVector * 0.5 + (aVector * 0.5)
				function: functionBlock)