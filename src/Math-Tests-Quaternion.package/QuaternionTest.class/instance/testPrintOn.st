running
testPrintOn
	| s | 
	s := q1234 printString .
	self should: [s = '(1 i: 2 j: 3 k: 4)'].