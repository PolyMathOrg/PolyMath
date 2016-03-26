tests
testFormatTypePostfix
	| r |
	r := a format: #(1 'rez' 1.8899) type: 'x' postfix: '%%'.
	self assert: r contents equals: 'x: 1.0%% , rez%% , 1.89%% '.
	r := a format: #(1.8899 true) type: '' postfix: nil.
	self
		assert: r contents
		equals: 'x: 1.0%% , rez%% , 1.89%% : 1.89 , true '