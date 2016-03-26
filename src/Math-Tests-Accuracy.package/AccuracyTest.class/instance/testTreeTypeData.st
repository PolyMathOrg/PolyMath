tests
testTreeTypeData
	| aTree |
	aTree := KeyedTree new.
	self assert: (a tree: aTree type: 'aa' data: 'bb') equals: aTree.
	self
		assert: aTree
		equals:
			(KeyedTree new
				at: 'data' put: 'bb';
				at: 'type' put: 'aa';
				yourself)