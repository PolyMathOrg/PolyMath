mathematical functions
squared
^(self includes: 0) 
	ifTrue: [ self class inf: 0 sup: ((sup abs>inf abs) ifTrue: [ sup squared ] ifFalse: [ inf squared] )] 
	ifFalse: [ self*self ]
	