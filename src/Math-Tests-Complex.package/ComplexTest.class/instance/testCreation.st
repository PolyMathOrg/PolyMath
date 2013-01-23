tests
testCreation
	"self run: #testCreation"
	
	| c |
	c := 5 i.
	self assert: (c real = 0).
	self assert: (c imaginary = 5).
	
	c := 6 + 7 i.
	self assert: (c real = 6).
	self assert: ( c imaginary = 7).
	
	c := 5.6 - 8 i.
	self assert: (c real = 5.6).
	self assert: (c imaginary = -8).
	
	c := Complex real: 10 imaginary: 5.
	self assert: (c real = 10).
	self assert: (c imaginary = 5).
	
	c := Complex abs: 5 arg: (Float pi/2).
	self assert: (c real rounded = 0).
	self assert: (c imaginary = 5).
	