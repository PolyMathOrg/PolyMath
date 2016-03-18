tests - mathematical functions
testRaisedToInteger
self assert: (x raisedToInteger: empty)=empty.
self assert: (i raisedToInteger: a) =empty.
self assert: (i raisedToInteger: 2)=empty.
self should: [ x raisedToInteger: 1.9 ] raise: Exception .
self should: [ x raisedToInteger: (RealInterval fromNumber: -0.8) ] raise: Exception .
self should: [ x raisedToInteger: c ] raise: Exception .
self assert: (x raisedToInteger: 1)=x.
self assert: (x raisedToInteger: (RealInterval fromNumber: 0))=1.
self assert: (x raisedToInteger: (IntervalUnion from:1 to:3))=(IntervalUnion 
	with: (e raisedToInteger: 3) 
	with: 0 
	with: g 
	with: (e raisedToInteger: 2)).
self assert: (x raisedToInteger: -1)=x reciprocal .