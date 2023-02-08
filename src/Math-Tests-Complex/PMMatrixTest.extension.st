Extension { #name : #PMMatrixTest }

{ #category : #'*Math-Tests-Complex' }
PMMatrixTest >> testIsRealOnComplexMatrix [
	| matrix |
	
	matrix := PMMatrix rows: { 
		{ 1 . 3 + 4i . 0 } .
		{ 1 - 2i . 2 . -4 } .
		{ -8 + 0i . 5 . -1 } }.
	
	self deny: matrix isReal.
]
