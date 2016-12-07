initialization
computeInitialValues
	bestPoints 
		add: (optimizingPointClass vector: result function: functionBlock).
	self buildInitialSimplex.
	worstVector := bestPoints removeLast position