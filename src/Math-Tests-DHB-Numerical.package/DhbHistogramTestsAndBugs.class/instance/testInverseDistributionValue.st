tests
testInverseDistributionValue
self assert: ((h inverseDistributionValue: 1) = h maximum).
self assert: ((h inverseDistributionValue: 0) = h minimum).