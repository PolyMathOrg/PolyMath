tests-set operations
testQuasiUnion
| a|
self assert: (x quasiUnion: x)=x.
a:=-1 hull:0.
self assert: (x quasiUnion: (IntervalBox with: a with: a with:a)) asSimpleBoxes = (OrderedCollection with: (IntervalBox with: (-2hull:0) with: (-3 hull:0) with: (-1hull:0)) with: (IntervalBox with: (-2hull:0) with: (-3 hull:0) with: (2 hull: 2.8)) ).
