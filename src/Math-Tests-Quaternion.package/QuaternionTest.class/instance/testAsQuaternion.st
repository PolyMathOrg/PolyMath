running
testAsQuaternion
	self should: [1 asQuaternion = q1 asQuaternion].
	self should: [q1234 asQuaternion = q1234].
	