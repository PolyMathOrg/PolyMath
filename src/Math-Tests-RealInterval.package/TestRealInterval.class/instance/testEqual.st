tests - comparing
testEqual
|o1|
self assert: empty negated=empty.
self assert: empty negated hash=empty hash.
self assert: empty =IntervalUnion new.
self assert: empty hash=IntervalUnion new hash.
self deny: empty =(IntervalUnion with:1).
self deny: (IntervalUnion with:1)=empty .
self deny: z =empty.
self deny: z hash=empty hash.
self deny: empty =z.
self deny: 0 =empty.
self deny: empty =0.
self deny: 0 hash=empty hash.
self assert: 0=z.
self assert: z=0.
self assert: z hash=0 hash.
self assert: 1=o.
self assert: o hash=1 hash.
o1:= o copy.
self assert: o1=o.
o1 sup: 1.0 successor .
self deny: 1=o1.
self deny: o1=1.
self deny: o=o1.
self deny: o1=o.
self deny: o1 hash=o hash.
self deny: a =b.
self deny: a negated=b.
self deny: b =a.
self deny: b=a negated.
o1:=IntervalUnion with:e.
self assert: e=o1.
self assert: o1=e.
self assert: e hash=o1 hash.
self deny: d=o1.
self deny: o1=d.
self deny: d hash=o1 hash.
o1:=IntervalUnion with:1.
self assert: o=o1.
self assert: o1=o.
self assert: 1=o1.
self assert: o1=1.
self assert: o1 hash=1.
self deny: z=o1.
self deny: o1=z.
self deny: 0=o1.
self deny: o1=0.





