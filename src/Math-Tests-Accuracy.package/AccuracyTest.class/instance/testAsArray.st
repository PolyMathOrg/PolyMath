tests
testAsArray
	self assert: (a asArray: 'bla') = #('bla').
	self assert: (a asArray: #('bla'))= #('bla').
	self assert: (a asArray: #('bla')asOrderedCollection )= #('bla').