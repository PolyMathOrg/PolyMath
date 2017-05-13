comparing
closeTo: aPMVector
	"Compare two vectors using the default precision from Float >> #closeTo:."

	^ self closeTo: aPMVector precision: 0.0001.