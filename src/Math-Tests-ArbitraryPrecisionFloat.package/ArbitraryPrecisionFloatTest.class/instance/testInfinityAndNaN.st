testing-coercing
testInfinityAndNaN
	| inf nan |
	inf := Float infinity.
	nan := Float nan.
	self assert: inf + two equals: inf.
	self assert: half + inf negated equals: inf negated.	
	self assert: (nan + minusOne)  isNaN .
	self assert: inf - huge equals: inf.
	self assert: half - inf equals: inf negated.
	self assert: minusTwo - inf negated equals: inf.
	self assert: (one - nan) isNaN.
	self assert: inf * two equals: inf.
	self assert: minusOne * inf equals: inf negated.
	self assert: inf negated * minusOne equals: inf.
	self assert: (huge * nan) isNaN.
	self assert: inf negated / minusTwo equals: inf.
	self assert: zero / inf negated equals: 0.	
	self assert: one / inf equals: 0.
	self should: [inf / zero] raise: ZeroDivide.	
	self assert: (nan  / two) isNaN.	
	self assert: (inf raisedTo: huge) equals: inf.
	self assert: (huge raisedTo: inf) equals: inf.
	self assert: (nan raisedTo: two) isNaN.
	self assert: (two raisedTo: nan) isNaN.
	self deny: nan <= one.
	self deny: zero >= nan.
	self assert: one < inf.
	self assert: zero ~= nan.
	self deny: nan = one.