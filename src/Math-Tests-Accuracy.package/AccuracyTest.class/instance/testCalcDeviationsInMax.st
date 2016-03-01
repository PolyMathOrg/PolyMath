tests
testCalcDeviationsInMax
	| r c |
	c := #(#(1 2 3)#(2 3 6) ).
	r := { (3/2) . (9/4). 4}.
	self assert: (a calcDeviations: r in: c max: false) = { (-100/3)asFloat . (-100/9)asFloat . -25}.
	self assert: (a calcDeviations: r in: c max: true) = { (100/3)asFloat . (100/3)asFloat . 50}.