running
testProductWithVector
	| vec |
	vec := DhbVector new: 2.
	vec at: 1 put: 1.
	vec at: 2 put: 2.
	"This uses productWithVector"
	self should: [(vec * q1234 at: 2 )= (2 * q1234)].
	
	"This uses adaptToQuaternion:andSend:"
	self should: [(q1234 * vec at: 1) = q1234].