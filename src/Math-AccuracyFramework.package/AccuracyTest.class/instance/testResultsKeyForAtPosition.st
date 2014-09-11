tests
testResultsKeyForAtPosition
	self assert:( a resultsKeyFor: 'Aaa' AtPosition:2) = #(4 4) .
	self assert: (a resultsKeyFor: 'Bbb' AtPosition:1) = #(2). 
	a run.
	self assert: (a dataTree atPath: {'names'. 'Ccc'. #(1).a resultsKeyFor: 'Ccc' AtPosition:1.'arguments'}) = 1. 
	self assert: (a dataTree atPath: {'names'. 'Ccc'. #(1).a resultsKeyFor: 'Ccc' AtPosition:3.'arguments'}) = 0.9.
	self assert: (a resultsKeyFor: 'Eee' AtPosition:2) = #(1 3).
	self assert: (a resultsKeyFor: 'Fff' AtPosition:1) = #(0 1 0 -2) 