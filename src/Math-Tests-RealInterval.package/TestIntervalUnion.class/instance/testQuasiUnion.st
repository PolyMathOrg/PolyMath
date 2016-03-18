tests - set operations
testQuasiUnion
| f |
self assert: (x quasiUnion: i) =x .
self assert: (i quasiUnion:  x) =x .
f:=(IntervalUnion with:a with:e).
self assert: (a quasiUnion: x) =f.
self assert: (x quasiUnion: a) =f.
