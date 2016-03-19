mathematical functions
raisedTo: anInt
^(anInt isIntervalUnion 
	ifTrue: [ self with: anInt intervalCollect:[ :f :s|f raisedTo: s] ]
	ifFalse:  [ self intervalCollect: [ :i|i raisedTo: anInt ] ])