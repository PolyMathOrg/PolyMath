tests
testWrongAverageProbabilistic
"is a probabilistic test that occasionally fails, but it should happen not too often"
|d|
d:=self numberOfRejectionsFor: (DhbNormalDistribution new: 1 sigma: 1).
self assert:d>97.