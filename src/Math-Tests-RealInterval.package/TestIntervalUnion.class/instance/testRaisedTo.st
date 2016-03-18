tests - mathematical functions
testRaisedTo
|f |
self assert: (x raisedTo: empty)=empty.
self assert: (0 raisedTo: i)=empty.
self assert: (d raisedTo: i)=empty.
self assert: (i raisedTo: a) =empty.
self assert: (i raisedTo: 2)=empty.
self assert: (i raisedTo: x)=empty.
self assert: ((IntervalUnion with:e) raisedTo: 1)=e.
self assert: ((IntervalUnion with:e) raisedTo: 1.0)=empty. "notice the difference, negative numbers cant be raised to Floats"
self assert: ((IntervalUnion with:e) raisedTo: z)=1.
f:=IntervalUnion with: 0 with: 1.
self assert: (0 raisedTo: x)=f.
self assert: (1 raisedTo: x)=1.
self assert: ((1/2) raisedTo: x)=(IntervalUnion with:1 with:(RealInterval inf: 0 sup:(1/4) ) with: ((1/2) raisedTo: e)).
self assert: ((3/2) raisedTo: x)=(IntervalUnion with:1 with:(RealInterval inf: (9/4) sup: Float infinity ) with: ((3/2) raisedTo: e)).
self assert: (a raisedTo: x)=a.
self assert: (a negated raisedTo: x)=f. "implicit integers in g are not taken care of at the moment! unfortunately the whole #raisedTo: is a bit complicated ( i still expect to find several bugs in it), i should streamline this thing first, before correcting that."

"
self assert:  (d raisedTo: 2)=(RealInterval inf: 0 sup:64)   .
self assert:  (d raisedTo: (-1/2))= (RealInterval inf: (8 raisedTo: (-1/2)) sup: Float infinity )  .
self assert:  (d raisedTo: (1/2))= (RealInterval inf: 1 sup: Float infinity )  .
self assert:  (d raisedTo: o)=(RealInterval inf: 0 sup:8)   .
self assert:  (d raisedTo: -1)=(RealInterval inf: (1/8) sup: Float infinity)   .
self assert:  (d raisedTo: z)=o   .
self assert:  (d raisedTo: a)=a  .
self assert:  (d raisedTo: a negated)=a  .
self assert:  (d raisedTo: b)=a  .
self assert:  (d raisedTo: g)=a  .
self assert:  (d raisedTo: e)=(RealInterval inf: (8 raisedTo:  (-5/4)) sup: Float infinity).
f:=a copy.
f sup: 0.
f inf: -1.
self assert:  (d raisedTo: f)=(RealInterval inf: (1/8) sup: Float infinity)   .
self assert:  (d raisedTo: f negated)=(RealInterval inf: 0 sup:8).
e:=(e/2)negated .
self assert:  (e raisedTo: a)=(RealInterval inf: 0 sup: 1)   .
self assert:  (e raisedTo: a negated )=(RealInterval inf: 1 sup: Float infinity)   .
self assert:  (e raisedTo: g)=(RealInterval inf: 0 sup: (25/64)).
self assert:  ((e raisedTo: e) equalsTo: (RealInterval inf: 0.54171335479 sup:0.83840721)).
e sup:1. 
self assert:  (e raisedTo: e)=e.
f sup: 2.
f inf: 1.
self assert:  (f raisedTo: d)=(RealInterval inf: (1/2) sup: 256).
self assert:  (f raisedTo: e)=f.
self assert:  (f raisedTo: b)=a.
self assert:  (f raisedTo: c)=(RealInterval inf: 1 sup: 128).
self assert: (a negated raisedTo: 2)=0.
self assert: (a negated raisedTo: a negated)=1.
self assert: (a negated raisedTo: a)=(IntervalCollection with:o with:z).

self assert:( 0 raisedTo:g)=0.
self assert:( 0 raisedTo:h)=(IntervalCollection with:o with:z).
self assert:( 0 raisedTo:z)=1.
self assert:( 2 raisedTo: d)=(RealInterval inf: (1/2) sup: 256)..
self assert:( 2 raisedTo:g)=(RealInterval inf: 4 sup: Float infinity).
self assert:( 2 raisedTo:h)=(RealInterval inf: 0 sup: 4)."
