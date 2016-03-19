accessing
inf: aNumber 
|i|
i:=self findFirst: [ :int|(aNumber < int inf) or:[int includes: aNumber ]].
i=0 
	ifTrue:[self removeAll ]
	ifFalse:[(i-1)timesRepeat: [ self removeFirst ]].
self isEmpty ifTrue: [ ^nil ].
self first inf:aNumber.
self reSort.
self reduce .
^aNumber 
 