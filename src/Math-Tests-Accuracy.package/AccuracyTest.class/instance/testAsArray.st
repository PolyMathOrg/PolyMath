tests
testAsArray
	self assert: (a asArray: 'bla') equals: #('bla').
	self assert: (a asArray: #('bla')) equals: #('bla').
	self
		assert: (a asArray: #('bla') asOrderedCollection)
		equals: #('bla')