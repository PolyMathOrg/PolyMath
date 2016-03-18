tests - mathematical functions
testArcTan
self assert: empty arcTan =empty.
self assert: z arcTan =0.
self assert: o arcTan=(Float halfPi /2).
self assert: o negated arcTan=(Float halfPi /2) negated .
self assert: a arcTan=(RealInterval inf: 0 sup: Float halfPi).
self assert: b arcTan=(RealInterval inf: Float halfPi negated  sup: Float halfPi).
self assert: e  arcTan =(RealInterval inf: (-5/4)arcTan sup: (-3/4)arcTan) .
self assert: h  arcTan =(RealInterval inf: Float halfPi negated sup: 2 arcTan) .
