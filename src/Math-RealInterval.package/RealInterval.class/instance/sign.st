mathematical functions
sign
|c|
self isEmpty ifTrue: [ ^RealInterval new ].
c:=OrderedCollection new.
(inf<0)ifTrue: [ c add: -1 ].
(self includes: 0)ifTrue: [ c add: 0 ].
(sup>0)ifTrue: [ c add: 1 ].
^c size=1 ifTrue: [ c first ] ifFalse: [IntervalUnion  withAll: c] 
	