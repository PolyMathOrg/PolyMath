testing
testEquality
	"self run: #testEquality"
	"self debug: #testEquality"
	
	self assert: 0i = 0.
	self assert: (2 - 5i) = ((1 -4 i) + (1 - 1i)).
	self assert: 0i isZero.
	self deny: (1 + 3 i) = 1.
	self deny: (1 + 3 i) = (1 + 2i).

"Some more stuff"
	self deny: (1 i) = nil.
	self deny: nil = (1 i).

	self deny: (1 i) = #(1 2 3).
	self deny: #(1 2 3) = (1 i).

	self deny: (1 i) = 0.
	self deny: 0 = (1 i).

	self assert:  (1 + 0 i) = 1.
	self assert:  1 = (1+ 0 i).

	self assert:  (1 + 0 i) = 1.0.
	self assert:  1.0 = (1+ 0 i).

	self assert:  (1/2 + 0 i) = (1/2).
	self assert:  (1/2) = (1/2+ 0 i).