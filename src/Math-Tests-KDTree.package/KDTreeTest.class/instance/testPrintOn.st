tests
testPrintOn
	| aStream s |
	aStream := ReadWriteStream with: ''.
	(PMKDTree withAll: #(#(1) #(4))) printOn: aStream.
	s := aStream contents.
	self assert: (s findString: 'a PMKDTree') equals: 1.
	self assert: (s allRangesOfSubstring: 'nil') size equals: 3.	"3 empty leafs should be printed"
	self assert: (s allRangesOfSubstring: '1') size equals: 3.	"twice dimension 1, once value 1"
	self assert: (s allRangesOfSubstring: '4') size equals: 1