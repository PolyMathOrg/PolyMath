mathematical functions
simpleSign
"does never return 0. for '0 sign' it returns 1. calculations can become much faster than with #sign!"
|c|
self isEmpty ifTrue: [ ^RealInterval new ].
c:=OrderedCollection new.
(inf<0)ifTrue: [ c add: -1 ].
(sup>0)ifTrue: [ c add: 1 ].
^c size=1 
	ifTrue: [ c first ] 
	ifFalse: [c size =0 
		ifTrue:[1] 
		ifFalse: [IntervalUnion  withAll: c]] 
	