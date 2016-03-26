tests
testNew2
	| n |
	n := NNStore new: 3.
	n add: #(3 1).
	n add: #(1 2).
	self deny: n isFull.
	self assert: n completeData equals: #(#(1 2) #(3 1))