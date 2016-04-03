setup
setUp

	accumulator := DhbCovarianceAccumulator new: 5.
	server := PMPrincipalComponentAnalysisServer new.
	100 timesRepeat: [ accumulator accumulate: server next ].
	average := accumulator average.
	covarianceMatrix := accumulator covarianceMatrix.
	