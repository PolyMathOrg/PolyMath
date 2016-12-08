testing-arithmetic
testRoundToNearestEven
	"Check that IEEE default rounding mode is honoured,
	that is rounding to nearest even"
		
	self assert: ((one timesTwoPower: 52)+(0+(1/4))) asTrueFraction = ((1 bitShift: 52)+0).
	self assert: ((one timesTwoPower: 52)+(0+(1/2))) asTrueFraction = ((1 bitShift: 52)+0).
	self assert: ((one timesTwoPower: 52)+(0+(3/4))) asTrueFraction = ((1 bitShift: 52)+1).
	self assert: ((one timesTwoPower: 52)+(1+(1/4))) asTrueFraction = ((1 bitShift: 52)+1).
	self assert: ((one timesTwoPower: 52)+(1+(1/2))) asTrueFraction = ((1 bitShift: 52)+2).
	self assert: ((one timesTwoPower: 52)+(1+(3/4))) asTrueFraction = ((1 bitShift: 52)+2).