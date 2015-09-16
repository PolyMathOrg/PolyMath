tests
testDhbCauchyDistribution
|a|
a:=DhbCauchyDistribution shape: -40.2 scale: 2.1 .
"this line produced an error:"
self assert: (a inverseDistributionValue: 0)=Float infinity negated.
self assert: (a inverseDistributionValue: 1)=Float infinity.
