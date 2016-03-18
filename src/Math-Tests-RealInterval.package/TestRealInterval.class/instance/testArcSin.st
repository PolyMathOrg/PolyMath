tests - mathematical functions
testArcSin
self assert: empty arcSin =empty.
self assert: z arcSin =0.
self assert: o arcSin=Float halfPi.
self assert: o negated arcSin=Float halfPi negated .
self assert: a arcSin=(RealInterval inf: 0 sup: Float halfPi).
self assert: b arcSin=(RealInterval inf: Float halfPi negated  sup: Float halfPi).
self assert: c arcSin =Float halfPi.
self assert: e  arcSin =(RealInterval inf: Float halfPi negated sup: (-3/4)arcSin) .
