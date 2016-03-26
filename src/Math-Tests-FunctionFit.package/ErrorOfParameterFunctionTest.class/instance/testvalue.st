tests
testvalue
	f data: col.
	f errorType: #squared.
	self assert: (f value: #(0 1)) equals: 181 / 144.
	f errorType: #abs.
	self assert: (f value: #(0 1)) equals: 23 / 12.
	f errorType: #median.
	self assert: (f value: #(0 1)) equals: 2 / 3.
	f data: (col copyFrom: 1 to: 2).
	self assert: (f value: #(0 1)) equals: 1 / 2.
	f quartile: 1.
	self assert: (f value: #(0 1)) equals: 2 / 3.
	f quartile: 0.
	self assert: (f value: #(0 1)) equals: 1 / 2.
	f errorType: #squared.
	self assert: (f realValue: #(0 0)) equals: (25 / 72) sqrt