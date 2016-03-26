running
testRandomIsLessThanOne
	| r |
	r := Quaternion random.
	self assert: r abs >= 0.0.
	self assert: r abs <= 1.0.
	self assert: r isQuaternion.
	r := q1234 random.
	self assert: r qr < q1234 abs.
	self assert: r qi < q1234 abs.
	self assert: r qj < q1234 abs.
	self assert: r qk < q1234 abs