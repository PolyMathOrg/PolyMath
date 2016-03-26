tests
testArgumentAt
	self assert: (a argumentAt: 'Aaa') equals: #(#(false) #(true)).
	self assert: (a argumentAt: 'Bbb') equals: #(#('a') #('AG')).
	self assert: (a argumentAt: 'Ddd') isNil.
	self assert: (a argumentAt: 'Ccc') equals: #(#(1) #(1.1) #(0.9))