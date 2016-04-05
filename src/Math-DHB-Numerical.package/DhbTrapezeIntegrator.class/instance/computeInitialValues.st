operation
computeInitialValues
		"Private"
	step := to - from.
	sum := ( ( functionBlock value: from) + ( functionBlock value: to)) * step /2.
	result := sum