tests-mathematical functions
testExp
|a b|
b:=3 exp.
a:=three exp.
self assert: (a eps equalsTo:b).
self assert: (a eps2 equalsTo:b).
self assert: (a eps1eps2 equalsTo:b).
self assert: (a value =b).
self assert: one = zero exp.