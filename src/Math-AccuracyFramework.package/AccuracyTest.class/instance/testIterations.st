tests
testIterations
	| s d|
	a iterations: 2; run.
	d := a dataTree at: 'names'.
	s := (d atPath: #('Aaa' #(1 2) #(5 3) '+dev')) first negated.
	self assert: ((d atPath: #('Aaa' #(1 2) #(5 3) '-dev')) first closeTo: s).
	s := d atPath: #('Aaa' #(3 2.8888) #(5 3) 'standard deviation').
	self assert: s first > 0.
	self assert: s second = 0.
	self assert: (d atPath: #('Ddd' 'data')) = #((2 3) (2 3)).
	s:=d atPath: #('Ddd' 'error').
	self assert: (s first closeTo: -45).
	self assert: (s second closeTo: -26.6666667).