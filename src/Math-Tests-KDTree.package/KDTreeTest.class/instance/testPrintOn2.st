tests
testPrintOn2
	| aStream s |
	aStream := ReadWriteStream with: ''.
	(PMIndexedKDTree withAll: #(#(1))) printOn: aStream.
	s := aStream contents.
	self assert: (s findString: 'a PMIndexedKDTree') equals: 1.
	self assert: (s allRangesOfSubstring: '1') size equals: 2