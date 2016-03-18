tests
testBoxSplicing
|f c bs i a|
f:=[:x|(x at:1) + ((x at:2)*2)].
c:=Constraint block: f image: (RealInterval inf: -2 sup: 10).
bs:=BoxSplicing new.
bs addConstraint: c.
a:=RealInterval inf: -2 sup:30.
bs box:(OrderedCollection with: a with:a ).
i:=bs doRepeatedSplicing  .
self assert: (i first equalsTo: (RealInterval inf: -2 sup: 14)).
self assert: (i first includes: 14).
self assert: (i first includes: -2).
self assert: (i second equalsTo: (RealInterval inf: -2 sup: 6)).
self assert: (i second includes: 6).
self assert: (i second includes: -2).
self assert: a=(RealInterval inf: -2 sup:30).
bs box:(IntervalBox with: a with:a ).
i:=bs doRepeatedSplicing  .
self assert: (i first equalsTo: (RealInterval inf: -2 sup: 14)).
self assert: (i first includes: 14).
self assert: (i first includes: -2).
self assert: (i second equalsTo: (RealInterval inf: -2 sup: 6)).
self assert: (i second includes: 6).
self assert: (i second includes: -2).