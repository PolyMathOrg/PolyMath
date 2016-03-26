running
testAngle
	self assert: q1 angle equals: 0.
	self assert: (q12 - q1) angle equals: Float pi.
	self assert: (q123 - q12) angle equals: Float pi.
	self assert: (q1234 - q123) angleInDegrees equals: 180