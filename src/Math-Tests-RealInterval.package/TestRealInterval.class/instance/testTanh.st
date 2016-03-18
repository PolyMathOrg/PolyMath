tests - mathematical functions
testTanh
self assert: empty tanh =empty.
self assert: o tanh =1 tanh.
self assert: z tanh =0 tanh.
self assert: d tanh =(RealInterval inf: -1 tanh sup: 8 tanh).
self assert: d tanh =(RealInterval inf: -1 tanh sup: 8 tanh).
self assert: a tanh =(RealInterval inf: 0 tanh tanh sup: 800 tanh).