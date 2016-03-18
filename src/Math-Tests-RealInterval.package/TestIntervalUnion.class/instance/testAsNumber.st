tests - converting
testAsNumber
|y|
self assert: x asNumber =x.
self assert: i asNumber =empty.
x:=(IntervalUnion with:o).
self assert: x asNumber==1. 
x add:z.
y:=x copy.
self assert: x asNumber =y.  