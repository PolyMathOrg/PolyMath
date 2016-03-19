mathematical functions
raisedToInteger: anInteger
^(anInteger isIntervalUnion 
	ifTrue: [ self with: anInteger intervalCollect:[ :f :s|f raisedToInteger: s] ]
	ifFalse:  [ self intervalCollect: [ :i|i raisedToInteger: anInteger ] ])