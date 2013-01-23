running
testAngle
	self should: [ q1 angle = 0].
	self should: [(q12 - q1) angle = Float pi].
	self should: [(q123 - q12) angle = Float pi].
	self should: [(q1234 - q123) angleInDegrees = 180].