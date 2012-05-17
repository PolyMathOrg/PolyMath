tests
testConstantGenerator
	| g |
	g := ConstantGenerator new.
	g constant: 1.
	self assert: g next = g next.
	self assert: g next = g next.
	self assert: g next = 1.
	
	g := ConstantGenerator constant: 2.
	self assert: g next = 2.