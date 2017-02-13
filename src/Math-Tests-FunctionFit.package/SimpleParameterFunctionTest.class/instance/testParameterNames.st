tests
testParameterNames
	| s |
	s := PMSimpleParameterFunction function: f.
	self assert: s parameterNames asArray equals: #('x' 'cc' 'b')