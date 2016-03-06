tests
testWrongDistributionProbabilistic
"is a probabilistic test that occasionally fails, but it should happen rarely"
|d|
"wrong distribution with the correct mean and sd"
d:=DhbLaplaceDistribution  shape: 0 scale: (1/2)sqrt.
self assert: d average=0.
self assert: (d standardDeviation closeTo: 1).
d:=self numberOfRejectionsFor: d.
self assert:d>60.