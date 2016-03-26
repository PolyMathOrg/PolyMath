running
testPrintOn
	| s |
	s := q1234 printString.
	self assert: s equals: '(1 i: 2 j: 3 k: 4)'