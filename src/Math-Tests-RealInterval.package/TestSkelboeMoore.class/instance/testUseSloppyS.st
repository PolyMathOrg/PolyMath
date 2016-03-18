tests
testUseSloppyS
|f a r s r1|
f:=[:x| x squared sum].
a:= -5 hull:5.
s:=SkelboeMoore1 function: f box: (IntervalBox with: a with: a with: a with: a).
s useSloppySimplification: false.
r:=s evaluate.
s useSloppySimplification: true.
r1:=s evaluate.
self assert: r1 first size < r first size.