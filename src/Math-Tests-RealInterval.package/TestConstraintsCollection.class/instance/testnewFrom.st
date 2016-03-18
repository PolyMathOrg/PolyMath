tests
testnewFrom
|e c|
e:=Constraint new.
c:=ConstraintsCollection newFrom: e.
self assert: c isCollection .
self assert: c size =1 .
self assert: (c first) =e.
