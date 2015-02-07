testing-trigonometry
testArcTan2
	<timeout: 30 "seconds">
	-5 to: 5 by: 4/10 do: [:y |
		| yf yd |
		yf := y asArbitraryPrecisionFloatNumBits: Float precision.
		yd := yf asArbitraryPrecisionFloatNumBits: Float precision * 2.
		-5 to: 5 by: 4/10 do: [:x |
			| xf xd  |
			xf := x asArbitraryPrecisionFloatNumBits: Float precision.
			xd := xf asArbitraryPrecisionFloatNumBits: Float precision * 2.
			self assert: ((yd arcTan: xd) asFloat - (yf arcTan: xf) asFloat) isZero]].