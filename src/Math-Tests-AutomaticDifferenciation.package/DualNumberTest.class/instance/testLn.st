tests-mathematical functions
testLn
|a|
a:=three ln.
self assert: (a eps equalsTo:(1/3)).
self assert: (a value =3 ln).
self assert: one ln=zero.