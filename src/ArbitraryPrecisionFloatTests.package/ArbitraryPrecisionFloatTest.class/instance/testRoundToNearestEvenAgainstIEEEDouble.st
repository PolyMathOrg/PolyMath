testing-arithmetic
testRoundToNearestEvenAgainstIEEEDouble
	"Check that IEEE default rounding mode is honoured"

	#(1 2 3 5 6 7) do: 
			[:i | 
			self assert: ((one timesTwoPower: 52) + (i / 4)) asTrueFraction 
						= ((1 asFloat timesTwoPower: 52) + (i / 4)) asTrueFraction.
			self assert: ((one timesTwoPower: 52) - (i / 4)) asTrueFraction 
						= ((1 asFloat timesTwoPower: 52) - (i / 4)) asTrueFraction]