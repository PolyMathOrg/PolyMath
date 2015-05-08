tests-mathematical functions
testTan
|a b|
a:=three tan.
self assert: a value = 3 tan.
self assert: (a eps equalsTo: (3 tan squared +1)).
b:=Float halfPi  -0.000000000001.
a:=(DualNumber value:b eps:1) tan.
self assert: a value = b tan.
self assert: (a eps equalsTo: (b tan squared +1)).
 