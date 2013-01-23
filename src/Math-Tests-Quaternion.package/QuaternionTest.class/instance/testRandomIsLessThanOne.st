running
testRandomIsLessThanOne
	| r |
	r := Quaternion random.
	self should: [r abs >= 0.0].
	self should: [r abs <= 1.0].
	self should: [r isQuaternion].
	r := q1234 random.
	self should: [r qr < q1234 abs].
	self should: [r qi < q1234 abs ].
	self should: [r qj < q1234 abs].
	self should: [r qk < q1234 abs].
	