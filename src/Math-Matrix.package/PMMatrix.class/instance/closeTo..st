comparing
closeTo: aPMMatrix
	"Tests that we are within the default Float >> #closeTo: precision of aPMMatrix (0.0001)."
	^ self closeTo: aPMMatrix precision: 0.0001