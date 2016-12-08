testing-arithmetic
testDivide
	| serie |
	serie := {1. 2. 3. 5. 6. 7. 9. 10. 11. 12. 19. 243. 10 raisedTo: Float precision + 1. Float precision factorial. Float pi.}.
	serie do: [:num |
		| nf na |
		nf := num asFloat.
		na := num asArbitraryPrecisionFloatNumBits: Float precision.
		serie do:[:den |
			| df da ff fa |
			df := den asFloat.
			da := den asArbitraryPrecisionFloatNumBits: Float precision.
			ff := nf / df.
			fa := na / da.
			self assert: ff = fa]].