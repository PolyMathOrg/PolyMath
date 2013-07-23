tests
testVectorXT
	"a simple example of using a collection as state"
	| aBlock |
	aBlock := [:x : t | x collect: [:ea | t]].
	sys block: aBlock.
	self should: [(sys x: #(1 2 3) t: 2 ) = #(2 2 2)].
	self should: [(sys x: #(0 0) t: 2) = #(2 2)].
