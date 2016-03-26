tests
testInitialize2
	"a separate = method is necessary because of this scenario with resetting"

	| a b c |
	a := (NNStore newFrom: #(#(1 $a) #(3 1.0) #(0 '2'))) initialize.	"initialize = resetting"
	b := (NNStore newFrom: #(#(1 $a) #(3 false) #(0 '2'))) initialize.
	self assert: a equals: b.	"first  problematic part"
	c := #(#(3 true) #(2 1)).
	a addAll: c.
	b addAll: c.
	self assert: a equals: b.	"second problematic part"
	c := #(2 nil).
	a add: c.
	self deny: a = b.
	b add: c.
	self assert: a equals: b