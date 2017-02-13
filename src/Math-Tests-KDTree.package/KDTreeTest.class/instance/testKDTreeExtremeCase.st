tests
testKDTreeExtremeCase
	| bResult |
	tree := PMKDTree withAll: #(#(1)).
	bResult := tree nnSearch: #(2) i: 3.
	self assert: bResult size equals: 1.
	self assert: bResult first equals: #(1).
	self should: [ PMKDTree withAll: #() ] raise: Exception.
	self should: [ PMKDTree withAll: #(2) ] raise: Exception.
	self should: [ PMKDTree withAll: #(#(2) #('v')) ] raise: Exception.
	self should: [ PMKDTree withAll: #(#(2) #()) ] raise: Exception.
	self should: [ PMKDTree withAll: #(#()) ] raise: Exception