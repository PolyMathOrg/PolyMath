tests
testErrorType
	self assert: f errorType equals: #squared.
	f errorType: #abs.
	self assert: f errorType equals: #abs.
	self should: [ f errorType: #square ] raise: MessageNotUnderstood.
	self should: [ f errorType: 'squared' ] raise: MessageNotUnderstood.
	f quartile: 1 / 4.
	f errorType: #median.
	self assert: f errorType equals: #quartile.
	self assert: f quartile equals: 1 / 2