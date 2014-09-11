tests
testArgumentAt
	self assert: (a argumentAt: 'Aaa') = #(#(false) #(true)).
	self assert: (a argumentAt: 'Bbb') = #(#('a') #('AG')).
	self assert: (a argumentAt: 'Ddd') isNil.
	self assert: (a argumentAt: 'Ccc') = #(#(1) #(1.1) #(0.9))