tests
testCountsUpTo
	self assert: (h countsUpTo: 4) equals: 3.
	self assert: (h countsUpTo: 2.1) equals: 2.
	self assert: (h countsUpTo: 3) equals: 2.
	self assert: (h countsUpTo: 2) equals: 1.
	self assert: (h countsUpTo: 1.04) equals: 1.	"at 1.04 a new bin starts"
	self assert: ((h countsUpTo: 1.02) closeTo: 0.5).	"hence this is correct"
	self assert: (h countsUpTo: 1) equals: 0