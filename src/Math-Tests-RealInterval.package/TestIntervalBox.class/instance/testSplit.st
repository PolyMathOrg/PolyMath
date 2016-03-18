tests-converting
testSplit
|y z w|
y:=x copy.
z:=x copy.
w:=3 sqrt negated .
(y at:2) sup: w.
(z at:2 ) inf: w.
self assert: x split= (Array with: y with: z).