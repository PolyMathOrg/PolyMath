running
testUnreal
	self assert: q1234 unreal real equals: 0.
	self
		assert: q1234 unreal squared
		equals: (2 squared + 3 squared + 4 squared) negated