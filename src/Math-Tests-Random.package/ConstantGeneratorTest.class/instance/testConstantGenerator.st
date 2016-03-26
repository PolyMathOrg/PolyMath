tests
testConstantGenerator
	| g |
	g := ConstantGenerator new.
	g constant: 1.
	self assert: g next equals: g next.
	self assert: g next equals: g next.
	self assert: g next equals: 1.
	g := ConstantGenerator constant: 2.
	self assert: g next equals: 2