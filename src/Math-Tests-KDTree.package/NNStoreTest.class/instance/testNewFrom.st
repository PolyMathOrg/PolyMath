tests
testNewFrom
	| n |
	n := PMNNStore newFrom: #(#(1 $a) #(3 1.0) #(0 '2')).
	self assert: n data equals: #('2' $a 1.0).
	self assert: n isFull.
	self assert: n maxDistance equals: 3.
	n add: #(2 true).
	self assert: n maxDistance equals: 2.
	n add: #(0.5 nil).
	self assert: n maxDistance equals: 1.
	self assert: n data equals: #('2' nil $a)