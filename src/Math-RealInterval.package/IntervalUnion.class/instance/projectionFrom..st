accessing
projectionFrom: aNumber
"returns the nearest number in the receiver of the same type as aNumber, or Float nan if such a
number does not exist"
| y x|
(aNumber isNaN or:[self isEmpty ]) ifTrue: [ ^Float nan].
(aNumber < self inf) ifTrue: [ ^self privateprojectionFrom: aNumber startingAt: 1 directionUp: true].
(aNumber > self sup) ifTrue: [ ^self  privateprojectionFrom: aNumber startingAt: self size directionUp: false].
self findBinaryIndex: [ :interval | 
	x:=interval - aNumber. 
	(x inf >0) ifTrue: [-1] ifFalse: [ (x sup <0)	ifTrue: [1] ifFalse:[0] ] ]
  do: [ :found | ^aNumber]
  ifNone: [ :a :b | 
	x:=self  privateprojectionFrom: aNumber startingAt: a directionUp: false.
	y:=self  privateprojectionFrom: aNumber startingAt: b directionUp: true.
	x isNaN ifTrue: [ ^y ] ifFalse: [ y isNaN ifTrue: [ ^x ] ].
	^((x-aNumber)abs >(y-aNumber)abs)ifTrue: [ y ] ifFalse: [ x ] ] 