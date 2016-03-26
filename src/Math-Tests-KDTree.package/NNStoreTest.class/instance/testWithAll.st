tests
testWithAll
	| n |
	n := NNStore withAll: #(2 5 4).
	self assert: n completeData equals: #(#(nil 2) #(nil 5) #(nil 4)).
	n sortFor: nil.	"calling sortFor: is necessary with withAll:"
	self assert: n data equals: #(2 4 5).
	self assert: n isFull.
	n add: {3 . 6}.	"one has to be a bit carefull when one uses 
				 NNStore withAll:, as sortfor: changes this data. 
				 n add: #(3 6) is not possible here!"
	self assert: n data equals: #(2 6 4).
	n sortFor: nil.
	self assert: n data equals: #(2 4 6)