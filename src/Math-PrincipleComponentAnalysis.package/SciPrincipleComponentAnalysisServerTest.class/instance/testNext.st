tests
testNext

 	| server |
	server := SciPrincipleComponentAnalysisServer new.
	self assert: server next equals: #(1 -1 3 -2 -2).
	self assert: server next equals: #(2 -2 6 -4 -8). 