mathematical functions
raisedToInteger: anInteger
	^ anInteger = 0
		ifTrue: [ self class value: 1 eps: 0 ]
		ifFalse: [ self class value: (value raisedToInteger: anInteger) eps: anInteger * eps * (value raisedToInteger: anInteger - 1) ]