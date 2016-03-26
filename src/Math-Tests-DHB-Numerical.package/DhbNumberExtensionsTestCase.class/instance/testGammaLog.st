function evaluation
testGammaLog
	"Code example 2.11"

	| value |
	value := 2.5 gamma ln.
	self assert: (2.5 logGamma - value) abs < 1.0e-13