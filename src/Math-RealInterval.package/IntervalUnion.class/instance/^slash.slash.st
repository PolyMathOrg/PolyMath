arithmetic
// anI
^(anI isIntervalUnion 
	ifTrue: [ self with: anI intervalCollect:[ :f :s|f // s] ]
	ifFalse:  [ self intervalCollect: [ :i|i // anI ] ])