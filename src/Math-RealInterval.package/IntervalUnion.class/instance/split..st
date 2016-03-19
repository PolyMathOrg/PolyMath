converting
split:at
|n p|
n:=IntervalUnion new.
p:=IntervalUnion new.
self do:[:ri||s|
	s:=ri split:at.
	s ifNil: [(at<=ri inf)ifTrue: [ p addLast: ri ] ifFalse: [ n addLast: ri ]  ]
	  ifNotNil: [ n addLast:s first. p addLast: s second]].
p reSort strongReduce.
n reSort strongReduce.
^Array with: n with: p

