tests
testDistribution
	| mean standardDeviation g |
	mean := 147.
	standardDeviation := 17.
	g := (GaussianGenerator new).
	g
		mean: mean;
		standardDeviation: standardDeviation;
		generator: LCRandom new.
	g generator seed: 42.
	self checkDistributionOf: g withExpectedMeans: mean andExpectedStandardDeviation: standardDeviation.
	"Replicated test in a different place"
	mean := 0.
	standardDeviation := 10 .
	g mean: mean;
	  standardDeviation: standardDeviation.
	self checkDistributionOf: g withExpectedMeans: mean andExpectedStandardDeviation: standardDeviation.