running
setUp

	accumulator := DhbCovarianceAccumulator new: 5.
	server := SciPrincipleComponentAnalysisServer new.
	100 timesRepeat: [ accumulator accumulate: server next ].
	average := accumulator average.
	covarianceMatrix := accumulator covarianceMatrix.
	