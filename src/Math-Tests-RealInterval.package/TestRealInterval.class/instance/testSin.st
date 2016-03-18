tests - mathematical functions
testSin
"the real tests are in testCos"
self assert: empty sin =empty.
self assert: ((RealInterval inf: 0.9 sup: Float pi )sin equalsTo:  (RealInterval inf: 0 sup: 1)) .
