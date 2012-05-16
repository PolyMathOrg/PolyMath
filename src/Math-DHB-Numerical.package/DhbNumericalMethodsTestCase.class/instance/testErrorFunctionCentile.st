function evaluation
testErrorFunctionCentile
	"Code example 2.5"
	| weight average stDev centile |
	weight := 2.85.
	average := 3.39.
	stDev := 0.44.
	centile := (( weight - average) / stDev) errorFunction * 100.
	self should: [ ( centile - 10.986012) abs < 0.000001].