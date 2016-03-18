tests - comparing
testEqual
self assert: i=empty.
self assert: i hash=empty hash.
i add:2.
self assert: i=2.
self assert: i=(RealInterval fromNumber: 2).
self assert: i hash=2 hash.
self deny: i hash=x hash.
i:=x copy.
self assert: i=x.
self assert: i hash=x hash.
self assert:(x equalsTo: (IntervalUnion with: g with: 0.00000001 with:e)).
self deny:(x equalsTo: (IntervalUnion with: g with: 0.0000001 with:e)).



