tests
testDhbBetaDistribution
|d|
d:=DhbBetaDistribution shape: 0.9 shape: 0.9.
self assert: (d distributionValue: 1.0 successor)=1.
self assert: (d distributionValue: 4)=1.
self assert: (d distributionValue: 0.0 predecessor)=0.
self assert: (d distributionValue: -2)=0.

