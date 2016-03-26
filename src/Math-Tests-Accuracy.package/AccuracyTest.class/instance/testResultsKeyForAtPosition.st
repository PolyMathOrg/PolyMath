tests
testResultsKeyForAtPosition
	self assert: (a resultsKeyFor: 'Aaa' AtPosition: 2) equals: #(4 4).
	self assert: (a resultsKeyFor: 'Bbb' AtPosition: 1) equals: #(2).
	a run.
	self
		assert:
			(a dataTree
				atPath:
					{'names'.
					'Ccc'.
					#(1).
					(a resultsKeyFor: 'Ccc' AtPosition: 1).
					'arguments'})
		equals: 1.
	self
		assert:
			(a dataTree
				atPath:
					{'names'.
					'Ccc'.
					#(1).
					(a resultsKeyFor: 'Ccc' AtPosition: 3).
					'arguments'})
		equals: 0.9.
	self assert: (a resultsKeyFor: 'Eee' AtPosition: 2) equals: #(1 3).
	self
		assert: (a resultsKeyFor: 'Fff' AtPosition: 1)
		equals: #(0 1 0 -2 3)