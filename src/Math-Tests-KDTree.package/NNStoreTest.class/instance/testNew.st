tests
testNew
	| n |
	n := NNStore new: 1.
	self assert: n isEmpty.
	self assert: n data equals: #().
	self assert: n completeData equals: #().
	n add: #(1 2).
	n add: #(3 1).	"will not be added"
	self assert: n data equals: #(2)