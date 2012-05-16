function evaluation
testBeta
	"Code example 2.14"
	| value |

	value := 2.5 gamma * 5.5 gamma / 8 gamma.
	self should: [ ((2.5 beta: 5.5)  - value) abs < 1.0e-14].