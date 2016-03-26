running
testProduct
	self assert: q1234 * 5 equals: (5 i: 10 j: 15 k: 20).
	self assert: 5 * q1234 equals: (5 i: 10 j: 15 k: 20).
	self assert: 1 i * 1 i equals: -1.
	self assert: 1 j * 1 j equals: -1.
	self assert: 1 k * 1 k equals: -1.
	self assert: 1 i * 1 j equals: 1 k.
	self assert: 1 j * 1 k equals: 1 i.
	self assert: 1 k * 1 i equals: 1 j.
	self assert: 1 j * 1 i equals: -1 k.
	self assert: 1 k * 1 j equals: -1 i.
	self assert: 1 i * 1 k equals: -1 j.
	self assert: 1 i i equals: -1.
	self assert: 1 j j equals: -1.
	self assert: 1 k k equals: -1.
	self assert: 1 i j equals: 1 k.
	self assert: 1 j k equals: 1 i.
	self assert: 1 k i equals: 1 j.
	self assert: 1 j i equals: -1 k.
	self assert: 1 k j equals: -1 i.
	self assert: 1 i k equals: -1 j.
	self assert: q1234 * 1 i equals: q1234 i.
	self assert: q1234 * 1 j equals: q1234 j.
	self assert: q1234 * 1 k equals: q1234 k.
	self assert: (q1234 * 0) isZero.
	self assert: (0 / q1234) isZero.
	self assert: q1234 * q1234 conjugated equals: q1234 squaredNorm.
	self assert: 1 / q1234 equals: q1234 reciprocal.
	self assert: q1234 / q1234 equals: 1