tests - set operations
testUnion
|f|
self assert: (x union: i) =x .
self assert: (i union:  x) =x .
self assert: (x union:  empty) =x .
self assert: (empty union:  x) =x .
self assert: (x union: 1) =(o union:x) .
self assert:( (x union: 1) at:3) =1.
self assert: (1 union: x) =(x union:o) .
self assert: (x union:  x) =x .
self assert: (x union: 3) =x.
self assert: (3 union:  x) =x.
self assert: (x union: e) =x.
self assert: (e union: x) =x.
f:=(IntervalUnion with:a with:e).
self assert: (a union: x) =f.
self assert: (x union: a) =f.
i:=(IntervalUnion with:a).
self assert: (i union: x) =f.
self assert: (x union: i) =f.
i:=IntervalUnion with:g with: (RealInterval inf: Float infinity negated sup:(-3/4))with:0.
a inf:1.
self assert: (a negated union: x) =i.
self assert: (x union: a negated) =i.
f:=IntervalUnion with:(a copy inf:3;yourself) with:(e copy inf: -2;yourself).
i:=IntervalUnion with:g with: (RealInterval inf: -2 sup:(-3/4))with:0.
self assert: (x union: f) =i.
self assert: (f union: x) =i.