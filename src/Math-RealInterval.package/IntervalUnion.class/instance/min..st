comparing
min:  anI
^(anI isIntervalUnion 
	ifTrue: [ self with: anI intervalCollect:[ :f :s|f min: s] ]
	ifFalse:  [ self intervalCollect: [ :i|i min: anI ] ])