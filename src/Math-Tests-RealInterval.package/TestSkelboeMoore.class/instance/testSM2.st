tests
testSM2
|f a s |
f:=[:x| x squared sum].
a:= -5 hull:5.
s:=SkelboeMoore2 function: f box: (IntervalBox with: a with: a with: a with: a).
s maximumIterations: 1300.
self deny: s desiredPrecision.
s evaluate.
self assert: s desiredPrecision.
s desiredPrecision: 1e-11.
s evaluate.
self deny: s desiredPrecision.
self assert: s inExactResults>1.
