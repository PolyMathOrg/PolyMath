tests
testParameterNames
	| s |
	s := SimpleParameterFunction function: f.
	self assert: s parameterNames asArray equals: #('x' 'cc' 'b')