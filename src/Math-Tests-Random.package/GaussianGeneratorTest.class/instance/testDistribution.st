tests
testDistribution
	| mean standardDeviation g |
	mean := 147.
	standardDeviation := 17.
	g := (GaussianGenerator new).
	g
		mean: mean;
		standardDeviation: standardDeviation.
	g generator: LCRandom new.
	self checkDistributionOf: g withExpectedMeans: mean andExpectedStandardDeviation: standardDeviation.
	"Replicated test in a different place"
	mean := 0.
	standardDeviation := 10 .
	g := (GaussianGenerator new)
		mean: mean;
		standardDeviation: standardDeviation;
		generator: LCRandom new.
	self checkDistributionOf: g withExpectedMeans: mean andExpectedStandardDeviation: standardDeviation.