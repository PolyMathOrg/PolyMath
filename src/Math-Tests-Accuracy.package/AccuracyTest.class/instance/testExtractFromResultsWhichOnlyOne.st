tests
testExtractFromResultsWhichOnlyOne
	self
		assert: (a extractFromResults: #('bla' 'blah') which: 2 onlyOne: false)
		equals: 'blah'.
	self assert: a testGetterAaa second equals: #(true).
	self
		assert: (a extractFromResults: #('bla' 'blah') which: 1 onlyOne: true)
		equals: #('bla' 'blah').
	self assert: a testGetterAaa second equals: #(#(false) #(true))