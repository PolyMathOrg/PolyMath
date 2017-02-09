running
testProductWithVector
	| vec |
	vec := PMVector new: 2.
	vec at: 1 put: 1.
	vec at: 2 put: 2.
	"This uses productWithVector"
	self assert: (vec * q1234 at: 2) equals: 2 * q1234.

	"This uses adaptToQuaternion:andSend:"
	self assert: (q1234 * vec at: 1) equals: q1234