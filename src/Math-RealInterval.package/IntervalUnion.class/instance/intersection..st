set operations
intersection: anInt
^(anInt isIntervalUnion 
	ifTrue: [ self with: anInt intervalCollect:[ :f :s|f intersection: s] ]
	ifFalse:  [ self intervalCollect: [ :i|i intersection: anInt ] ])
