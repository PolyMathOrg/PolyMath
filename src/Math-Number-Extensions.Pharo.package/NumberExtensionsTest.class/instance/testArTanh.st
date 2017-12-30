tests
testArTanh
	self assert: 0 arTanh = 0.0 arTanh.
	self assert: 1 arTanh isFloat.
	self assert: 1 arTanh equals: 1.0 arTanh