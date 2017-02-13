tests
testRest
	| s vg |
	s := PMSimpleParameterFunction function: f.
	self assert: s parameters size equals: 3.
	vg := s valueAndGradient: 2.
	self assert: s parameters first equals: vg first.
	self assert: (vg second equalsTo: #(1 0 0)).
	s parameters: #(2 0 0).
	self assert: (s value: 0) equals: 2.
	self assert: s parameters equals: #(2 0 0).
	self assert: s parameterSize equals: 3