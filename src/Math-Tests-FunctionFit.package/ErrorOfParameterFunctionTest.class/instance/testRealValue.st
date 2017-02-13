tests
testRealValue
	f := PMErrorOfParameterFunction
		function: [ :i :a | i + a ]
		data:
			{(1 @ 1).
			(2 @ 2)}.
	f errorType: #squared.
	self assert: (f realValue: #(-2)) equals: 2.
	f errorType: #abs.
	self assert: (f realValue: #(-2)) equals: 2.
	f errorType: #median.
	self assert: (f realValue: #(-2)) equals: 2.
	f relativeError: true.
	f errorType: #squared.
	self assert: (f realValue: #(-2)) equals: (5 / 2) sqrt.
	f errorType: #abs.
	self assert: (f realValue: #(-2)) equals: 3 / 2.
	f errorType: #median.
	self assert: (f realValue: #(-2)) equals: 1