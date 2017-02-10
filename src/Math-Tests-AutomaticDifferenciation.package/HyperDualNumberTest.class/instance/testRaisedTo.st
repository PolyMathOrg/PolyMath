tests-mathematical functions
testRaisedTo
|a b|
self assert: ((three raisedTo: 2) equalsTo: three squared).
self assertEquality: (three raisedTo: 0) and: onec.
self assert: (((three + one) raisedTo: 1/2) equalsTo: (PMHyperDualNumber value: 2 eps: 1/2 eps2:1/2 eps1eps2: -1/8)).
self assertEquality: (zero raisedTo: 1.4)and:zeroc.
a:=2 raisedTo: three.
self assert: ((a value)equalsTo: 8) .
b:=2 ln* (2 raisedTo: 3).
self assert: (a eps equalsTo: b).
self assert: (a eps2 equalsTo: b).
self assert: (a eps1eps2 equalsTo: (2 ln * b)).
self assertEquality: (1 raisedTo: three)and:onec.
self assert: ((one raisedTo: one)equalsTo:  (PMHyperDualNumber value: 1 eps: 1 eps2: 1 eps1eps2: 2)).
a:=three raisedTo: three.
self assert: ((a value)equalsTo: 27) .
b:=(3 ln+1)*27.
self assert: (a eps equalsTo: b).
self assert: (a eps2 equalsTo: b).
self assert: (a eps1eps2 equalsTo: b*(3 ln+1)+9).


 