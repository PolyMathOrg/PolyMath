tests
testFastSplicing
|f c bs i a old|
f:=[:x|(x at:1) + ((x at:2)*2)].
c:=Constraint block: f image: (RealInterval inf: -2 sup: 10).
bs:=BoxSplicing new.
old:=bs class fastMaxIterations .
bs class fastMaxIterations: 3.
bs addConstraint: c.
a:=RealInterval inf: -2 sup:30.
bs box:(OrderedCollection with: a with:a ).
i:=bs doFastSplicing  .
self assert: (bs constraints size=1).
self assert: (i first includes: (RealInterval inf: -2 sup: 14)).
self assert: (i first inf= -2).
self assert: (i first sup<= 15).
self assert: (i second includes: (RealInterval inf: -2 sup: 6)).
self assert: (i second sup<= 7).
self assert: (i second inf= -2).
bs class fastMaxIterations: old.
