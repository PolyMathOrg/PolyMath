tests
testDhbVectorCompatibility
	| aVector bVector r |
	(Array lookupSelector: #asPMVector)
		ifNil: [ ^ self skip: 'necessary dhb package not loaded' ].
	aVector := #(0) asPMVector.
	bVector := #(-2.0) asPMVector.
	r := {aVector.
	#(-5.0) asPMVector.
	bVector} asPMVector.
	self initializeTreeWith: r as: true.
	self
		assert: (tree nnSearch: bVector i: 2)
		equals:
			{bVector.
			aVector}.
	self
		assert: (stupid nnSearch: bVector i: 2)
		equals:
			{bVector.
			aVector}.
	self initializeTreeWith: r as: false.
	r := tree nnSearch: bVector i: 2.
	self assert: r first equals: #(3 0.0).
	self assert: r second first equals: 1.
	self assert: (r second second closeTo: 4.0)