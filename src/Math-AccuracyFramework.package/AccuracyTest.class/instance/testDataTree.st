tests
testDataTree
	| s |
	a run.
	self assert: (a dataTree atPath: #('iterations')) = 1.
	self assert: (a dataTree atPath: #('names' 'data')) = #('Aaa' 'Bbb' 'Ccc' 'Ddd' 'Eee' 'Fff') asOrderedCollection.
	self assert: (a dataTree atPath: #('names' 'Aaa' #(1 2) #(4 4)))= (KeyedTree new
						at: 'arguments' put: true;
						at: 'data' put: #(#(1 1));
						at: 'error' put: #(300.0 300.0);
						at: 'expected result' put: #(4 4);
						at: 'result' put: #(1 1);
						at: 'type' put: 'result';
						yourself).
	self assert: (a dataTree atPath: #('names' 'Aaa' 'data')) = #(#(1 2) #(3 2.8888)).
	self assert: (a dataTree atPath: #('names' 'Bbb' #(3) 'data')) = #(#(2) #(3)).
	s:=a dataTree atPath: #('names' 'Ccc' #(3)).
	self assert: s keys size= 5.
	self assert: (a dataTree atPath: #('names' 'Fff' 'error')) = {0.(Float infinity).-100.0.(Float infinity negated)}.
