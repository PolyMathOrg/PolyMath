set operations
difference: anInt
|x|
^(anInt isIntervalUnion 
	ifTrue: [
		x:=self copy .
		anInt do:[:i|x:=x difference: i].
		x]
	ifFalse:  [ self intervalCollect: [ :i|i difference: anInt ] ])
