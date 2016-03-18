tests - copying
testCopy
|y|
y:=x copy.
i:=x copy.
self assert: x=i.
i:=i min:2.
self assert: x=y.
self deny:  x=i.

