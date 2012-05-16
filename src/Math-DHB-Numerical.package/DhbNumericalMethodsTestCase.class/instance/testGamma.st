function evaluation
testGamma
	"Code example 2.10"
	| value |
	value := Float pi sqrt * 3 / 4.
	self should: [ (2.5 gamma  - value) abs < 1.0e-14].