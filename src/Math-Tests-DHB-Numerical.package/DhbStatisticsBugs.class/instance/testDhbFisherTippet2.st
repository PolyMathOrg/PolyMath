tests
testDhbFisherTippet2
|d|
d:=DhbFisherTippettDistribution shape: -3 scale: 0.7 .
self assert: (d distributionValue: Float  fmax)=1. "old version could do this, but new version also because #exp uses a primitive who takes care of overflow" 
self assert: (d distributionValue: Float  fmax negated)=0.
self assert: (d distributionValue: -100)=0."bug is here"
self assert:(d distributionValue: 100)=1.
self assert:(d distributionValue: -3)= -1 exp.

