tests
testErrorType
self assert: (f errorType = #squared).
f errorType: #abs.
self assert: (f errorType = #abs).
self should: [f errorType: #square] raise: MessageNotUnderstood .
self should: [f errorType: 'squared'] raise: MessageNotUnderstood .
f quartile: (1/4).
f errorType: #median.
self assert: (f errorType = #quartile).
self assert: (f quartile =(1/2)).

