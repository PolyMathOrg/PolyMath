tests - set operations
testUnion
|f|
self assert: ((a union: a negated) =b).
self assert: ((a negated union: a) =b).
self assert: ((a union: a) =a).
self assert: ((empty union: d) =d).
self assert: ((a union: empty) =a).
self assert: ((empty union: empty) =empty ).
self assert: ((c union: e) =(e union:c)).
self assert: ((d union: e) =(RealInterval inf: (-5/4) sup: 8)).
self assert: ((d union: o) =d).
self assert: ((a union: h) =b).
f:=a negated.
self assert: ((f union: c) =(IntervalUnion with: f with: c) ).
self assert: (f union: 0)=f.
self assert: (empty union: 8)=8.
self assert: (8 union: 8)=8.
self assert: (8 union: 7.5)=(IntervalUnion with: 7.5 with: 8).
self assert: (7 union: empty)=7.
self assert: (-1 union: e)=e.
self assert: (-1 union: a)=(IntervalUnion with: -1 with: a).
self assert: (e union: -1)=e.
self assert: (a union: -1)=(IntervalUnion with: -1 with: a).
self assert: (z union: 0)=z.
self assert: (0 union: z)=z.







