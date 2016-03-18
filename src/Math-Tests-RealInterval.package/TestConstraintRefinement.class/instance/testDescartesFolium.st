tests
testDescartesFolium
"http://icwww.epfl.ch/~sam/Coconut-benchs/Transcendental/descartesfolium.mod
# Domains
var X >= -100, <= 100;
var Y >= -100, <= 100;

subject to
cons1 : (X^2)/Y + (Y^2)/X = 2;
cons2 : Y = exp(-X);" 
|box testBox f1 f2 cons1 cons2 cr r old|
box:=IntervalBox  with: (RealInterval inf: -100 sup: 100) with: (RealInterval inf: -100 sup: 100).
f1:=[:x|(x at:1)squared / (x at:2) +((x at:2) squared /(x at:1))].
(cons1:=Constraint block: f1) equalToNumber:  2.
f2:=[:x|(x at:1)negated exp - (x at:2)].
(cons2:=Constraint block: f2) equalToNumber:  0.
cr:=ConstraintRefinement constraints: {cons1. cons2} box: box.
old :=cr fast.
cr fast: false.
r:=cr evaluate. 
self assert: r size=2.
testBox :=IntervalBox with: (RealInterval inf: 0.29456271159628045 sup: 0.2945627115962816) with: (RealInterval inf: 0.7448572336907798 sup: 0.7448572336907809).
self assert: ((testBox includes: r first)or:[testBox includes: r second]). 
testBox :=IntervalBox with: (RealInterval inf: 0.8684182784952086 sup: 0.8684182784952094) with: (RealInterval inf: 0.41961473827445583 sup: 0.4196147382744562).
self assert: ((testBox includes: r first)or:[testBox includes: r second]).
f1 := cr sloppyResult.
self assert: f1 class=IntervalBox .
self assert: f1 first class=IntervalUnion .
self assert: f1 last class=IntervalUnion .

cr fast: old.
self assert: cr unpreciseResults =0.
self assert: cr desiredPrecision.