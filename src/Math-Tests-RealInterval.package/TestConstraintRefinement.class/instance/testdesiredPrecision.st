tests
testdesiredPrecision
"in a way this shows that #desiredPrecision: has less effect than one might think. this is probably a hint on some inefficiency here in the algo. the algo could perhaps be made faster"
|c b r r1 i|
c:=Constraint block: [ :x ||x1|x1:=x first.(x1 raisedToInteger: 3) - (5 * x1) ] .
c equalToNumber: 1. 
b :=ConstraintRefinement constraints: c box: (IntervalBox  with: (RealInterval inf: -10  sup: 10 )) .
r:=b evaluate.
i:=b iterations.
b desiredPrecision:3.
r1:=b evaluate.
 "an OrderedCollection(an IntervalBox([-2.1284190638445777,-0.2016396757234045]) an IntervalBox([2.3300587395679817,2.3300587395679826]))"
self assert: b iterations<i.
self assert: (r1 first includes: r last).
self assert: (r1 first includes: r second).
self deny: (r last includes: r1 first).
self deny: (r second includes: r1 first).