tests - accessing
testAccessing
|y|
self assert: i inf isNaN .
self assert: i sup isNaN .
self assert: x inf =(-5/4).
self assert: x sup = Float infinity .
i inf:1.
self assert: i isEmpty .
i sup: Float infinity .
self assert: i isEmpty .
y:=x copy.
y sup: Float infinity .
self assert: y=x.
y inf: -2.
self assert: y=(IntervalUnion with:g  with: 0 with:(RealInterval inf: -2 sup: (-3/4))).
y inf: 0.
self assert: y=(IntervalUnion with:g  with: 0).
y:=x copy.
y inf: -0.7.
self assert: y=(IntervalUnion with:g  with: (RealInterval inf: -0.7 sup: 0)).
y:=x copy.
y inf: Float infinity.
self assert: y isEmpty .
y:=x copy.
y sup: -1.
self assert: y=(RealInterval inf: (-5/4) sup: -1).
y:=x copy.
y sup: -2.
self assert: y isEmpty .
y:=x copy.
y sup: 3.
y inf:4.
self assert: y isEmpty .
