function evaluation
testBetaLog
	"Code example 2.15"
	| value |
	value := ( 2.5 gamma * 5.5 gamma / 8 gamma) ln.
	self should: [ ((2.5 logBeta: 5.5)  - value) abs < 1.0e-13].