converting
splitAtZero
"split into a negative and a positive part. result is different from #split:0 insofar as it always returns an Array"
^self isMixed 
	ifTrue: [ Array  with: (self class inf: inf sup: 0) with: (self class inf: 0 sup: sup) ] 
	ifFalse:[self negative 
		ifTrue: [ Array with: self with: RealInterval  new ] 
		ifFalse:  [ Array with: RealInterval new with: self ]  ]