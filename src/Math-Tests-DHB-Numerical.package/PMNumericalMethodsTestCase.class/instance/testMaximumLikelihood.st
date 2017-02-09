estimation
testMaximumLikelihood
	"Code example 10.11"

	"Note: the seemingly large error on the fit results is due to the binning of the histogram."

	| count shape scale genDistr hist fit fittedDistr parameters |
	count := 10000.
	shape := 0.
	scale := 1.
	hist := PMHistogram new.
	hist freeExtent: true.
	genDistr := PMFisherTippettDistribution shape: shape scale: scale.
	count timesRepeat: [ hist accumulate: genDistr random ].
	fit := PMMaximumLikelihoodHistogramFit
		histogram: hist
		distributionClass: PMFisherTippettDistribution.
	fittedDistr := fit evaluate.
	parameters := fittedDistr parameters.
	self assert: ((parameters at: 1) - shape) abs < 0.1.
	self assert: ((parameters at: 2) - scale) abs < 0.1.
	self assert: ((parameters at: 3) - count) abs < 100