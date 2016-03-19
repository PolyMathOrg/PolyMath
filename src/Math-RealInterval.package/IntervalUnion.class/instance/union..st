set operations
union: anInt
^(anInt isIntervalUnion 
	ifTrue: [ self copy addAll: anInt; yourself  ]
	ifFalse:  [ self copy add: anInt; yourself  ])
