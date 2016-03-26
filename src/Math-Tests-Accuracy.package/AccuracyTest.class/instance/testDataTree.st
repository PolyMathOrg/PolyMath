tests
testDataTree
	| s |
	a run.
	self assert: (a dataTree atPath: #('iterations')) equals: 1.
	self
		assert: (a dataTree atPath: #('names' 'data'))
		equals: #('Aaa' 'Bbb' 'Ccc' 'Ddd' 'Eee' 'Fff').
	self
		assert: (a dataTree atPath: #('names' 'Aaa' #(1 2) #(4 4)))
		equals:
			(KeyedTree new
				at: 'arguments' put: true;
				at: 'data' put: #(#(1 1));
				at: 'error' put: #(300.0 300.0);
				at: 'expected result' put: #(4 4);
				at: 'result' put: #(1 1);
				at: 'type' put: 'result';
				yourself).
	self
		assert: (a dataTree atPath: #('names' 'Aaa' 'data'))
		equals: #(#(1 2) #(3 2.8888)).
	self
		assert: (a dataTree atPath: #('names' 'Bbb' #(3) 'data'))
		equals: #(#(2) #(3)).
	s := a dataTree atPath: #('names' 'Ccc' #(3)).
	self assert: s keys size equals: 5.
	s := a dataTree atPath: #('names' 'Fff' 'error').
	self
		assert: (s copyFrom: 1 to: 4)
		equals:
			{0.
			Float infinity.
			-100.0.
			Float infinity negated}.
	self assert: (s at: 5) isNaN