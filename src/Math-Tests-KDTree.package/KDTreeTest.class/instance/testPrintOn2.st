tests
testPrintOn2
	| aStream s |
	aStream := ReadWriteStream with: ''.
	(IndexedKDTree withAll: #(#(1))) printOn: aStream.
	s := aStream contents.
	self assert: (s findString: 'an IndexedKDTree') equals: 1.
	self assert: (s allRangesOfSubstring: '1') size equals: 2