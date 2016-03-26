tests
testdata
	self assert: f data isNil.
	f data: col.
	self assert: f data equals: col