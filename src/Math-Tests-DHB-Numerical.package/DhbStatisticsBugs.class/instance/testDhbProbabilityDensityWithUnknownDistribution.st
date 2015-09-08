tests
testDhbProbabilityDensityWithUnknownDistribution
|d|
d:=DhbLogNormalDistribution new.
self assert: ((d distributionValue: 1)closeTo: 0.5).
self assert:((d distributionValue: 3.602)closeTo:  0.9).
self assert:((d acceptanceBetween: 1 and: 3.602)closeTo: 0.4).

