tests - mathematical functions
testRaisedToInteger
|f x|
f:=a negated.
self assert: (d raisedToInteger: empty)=empty.
self assert: (empty raisedToInteger: a) =empty.
self assert: (empty raisedToInteger: 2)=empty.
self should: [ d raisedToInteger: 1.9 ] raise: Exception .
self should: [ d raisedToInteger: (RealInterval fromNumber: -0.8) ] raise: Exception .
self should: [ d raisedToInteger: c ] raise: Exception .
self assert:( 0 raisedToInteger:z)=1.
self assert:( 0 raisedToInteger:z)=1.
self assert:( b raisedToInteger:0)=1.
self assert:( c raisedToInteger:z)=1.
self assert:( 0 raisedToInteger:o)=0.
self assert:( z raisedToInteger:o)=0.
self assert:( a raisedToInteger: 2)=a.
f:=RealInterval fromNumber: 2 .
x:=RealInterval fromNumber: 3 .
self assert:( a raisedToInteger: f)=a.
self assert:( b raisedToInteger: f)=a.
self assert:( a raisedToInteger: x)=a.
self assert:( b raisedToInteger: x)=b.
self assert:( b raisedToInteger: f negated )=a.
self assert:( b raisedToInteger: x negated)=b.
self assert:( d raisedToInteger: f)=(RealInterval inf: 0 sup: 64) .
self assert:( d raisedToInteger: x)=(RealInterval inf: -1 sup: 512) .
self assert:( d raisedToInteger: f negated)=(RealInterval inf: (1/64) sup: Float infinity ) .
self assert:( d raisedToInteger: x negated)=(IntervalUnion 
	with: (RealInterval inf: Float infinity negated sup: -1)
	with: (RealInterval inf: (1/512) sup: Float infinity)).
self assert: (e raisedToInteger: 2)=(RealInterval inf: (9/16) sup: (25/16)).
self assert: (g raisedToInteger: -2)=(RealInterval inf: 0 sup: (1/4)).
self assert:( h raisedToInteger: f)=a .
self assert:( h raisedToInteger: x)=(RealInterval inf: Float infinity negated sup: 8).
self assert:( h raisedToInteger: f negated)=a.
self assert:( h raisedToInteger: x negated)=(IntervalUnion 
	with: (RealInterval inf: Float infinity negated sup: 0)
	with: (RealInterval inf: (1/8) sup: Float infinity)).
self assert:( h negated raisedToInteger: f negated)=a.
self assert:( h negated raisedToInteger: x negated)=(IntervalUnion 
	with: (RealInterval inf: Float infinity negated sup: (-1/8))
	with: (RealInterval inf: 0 sup: Float infinity)).