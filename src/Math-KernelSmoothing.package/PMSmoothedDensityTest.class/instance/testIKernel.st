tests
testIKernel
density iKernel: [:x|x].
self assert: ((density distributionValue: 1)equalsTo: -1.87784268).
