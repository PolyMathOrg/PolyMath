as yet unclassified
testXTYieldsAValue
	"this will fail until implicit systems work. When they do, this test may be wrong."
	sys := ImplicitSystem new.
	sys block: [:x :t | t sin].
	self should: [0 = sys x: 0 t: 0 ].