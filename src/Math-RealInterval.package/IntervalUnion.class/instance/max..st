comparing
max:  anI
^(anI isIntervalUnion 
	ifTrue: [ self with: anI intervalCollect:[ :f :s|f max: s] ]
	ifFalse:  [ self intervalCollect: [ :i|i max: anI ] ])