tests - accessing
testAccessing
self assert: a sup=Float infinity .
self assert: a inf=0.
a inf: -1.
self assert: a inf= -1.
a sup: (-1/8).
self assert: a sup= (-1/8).
a sup: Float infinity.
self assert: a sup= Float infinity.
self assert: a inf= -1.
a sup: Float nan.
self assert: a isEmpty.
self assert: a inf isNaN .
a sup: (-1.9).
self assert: (a= -1.9).
self deny: a isEmpty.
a inf: -10e23.
self assert: a inf= -10e23.
self deny: a isEmpty.
self assert: a sup= -1.9.
a inf: 3.
self assert: a isEmpty.
self assert: a sup isNaN.
a inf: (31/9).
self assert: (a= (31/9)).
a inf: Float infinity .
self assert: a isEmpty.
self assert: a sup isNaN .
a inf: Float infinity negated.
self assert: a =b .
a inf: Float infinity .
self assert: a isEmpty.
a sup: Float infinity .
self assert: a =b .
a sup: Float infinity negated.
self assert: a isEmpty.








