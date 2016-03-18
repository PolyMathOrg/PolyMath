tests
testSM1
|f r s r1|
f:=[ :x| (2 * x) sin / (0.5 + x squared) ].
s:=SkelboeMoore1 function: f box: (-4 hull:4).
r:=s evaluate.
s:=SkelboeMoore1 function: f boxes: r first split.
r1 :=s evaluate.
self assert: r1 second sup < r second sup