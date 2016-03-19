arithmetic
quo: anI
^(anI isIntervalUnion 
	ifTrue: [ self with: anI intervalCollect:[ :f :s|f quo: s] ]
	ifFalse:  [ self intervalCollect: [ :i|i quo: anI ] ])