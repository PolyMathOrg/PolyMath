private
checkDoublePrecisionSerie: serie forFunction: func nBits: n
	serie do: [:y | self checkDoublePrecision: y forFunction: func nBits: n]