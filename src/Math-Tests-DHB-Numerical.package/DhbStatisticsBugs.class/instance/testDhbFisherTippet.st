tests
testDhbFisherTippet
|d|
d:=DhbFisherTippettDistribution new.
self assert: ((d integralFrom: -10 to: -0.1)closeTo: (d distributionValue: -0.1)).
self assert:((d integralUpTo: -0.1)closeTo: (d distributionValue: -0.1)).
self assert:((d integralFrom: -10 to: 0.1)closeTo: (d distributionValue: 0.1)).

