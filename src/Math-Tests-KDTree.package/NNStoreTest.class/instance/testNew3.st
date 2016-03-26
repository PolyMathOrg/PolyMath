tests
testNew3
	| n |
	n := NNStore new: 0.
	self assert: n isEmpty.
	self assert: n isFull.
	self assert: n equals: n copyEmpty.
	self assert: n data equals: #().
	self assert: n completeData equals: #()