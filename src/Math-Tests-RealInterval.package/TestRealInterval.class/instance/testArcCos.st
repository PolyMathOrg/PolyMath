tests - mathematical functions
testArcCos
self assert: empty arcCos =empty.
self assert: z arcCos =Float halfPi.
self assert: o arcCos=0.
self assert: o negated arcCos=Float pi.
self assert: a arcCos=(RealInterval inf: 0 sup: Float halfPi).
self assert: b arcCos=(RealInterval inf: 0 sup: Float pi).
self assert: c arcCos =0.
self assert: e  arcCos =(RealInterval inf: (-3/4)arcCos sup: Float pi) .
