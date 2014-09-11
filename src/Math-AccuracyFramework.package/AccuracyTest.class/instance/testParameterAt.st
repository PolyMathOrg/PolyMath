tests
testParameterAt
	self assert: (a parameterAt: 'Aaa') = #(#(1 2) #(3 2.8888)).
	self assert: (a parameterAt: 'Bbb') = #(#(1) #(3)).
	self assert: (a parameterAt: 'Ddd') isNil.
	self assert: (a parameterAt: 'Fff') isNil