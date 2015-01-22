tests
testConversion
	"self run: #testConversion"
	"self debug: #testConversion"
	
	self assert: ((1 + 2i) + 1) =  (2 + 2 i).
	self assert: (1 + (1 + 2i)) =  (2 + 2 i).
	self assert: ((1 + 2i) + 1.0) =  (2.0 + 2 i).
	self assert: (1.0 + (1 + 2i)) =  (2.0 + 2 i).
	self assert: ((1 + 2i) + (2/3)) = ((5/3) + 2 i ).
	self assert: ((2/3) + (1 + 2i)) = ((5/3) + 2 i )