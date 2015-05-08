tests-mathematical functions
testRaisedTo
|a |
self assertEquality: (three raisedTo: 2) and: three squared.
self assertEquality: (three raisedTo: 0) and: onec.
self assertEquality: ((three + one) raisedTo: 1/2) and: (DualNumber value: 2 eps: (1/2)).
self assertEquality: ((three + one) raisedTo: 3/2) and: (DualNumber value: 8 eps: 6).
self assertEquality: (zero raisedTo: 1.4)and:zeroc.
a:=2 raisedTo: three.
self assert: ((a value)equalsTo: 8) .
self assert: (a eps equalsTo: (2 ln* (2 raisedTo: 3))).
self assertEquality: (1 raisedTo: three)and:onec.
self assertEquality: (one raisedTo: one)and:one.
a:=three raisedTo: three.
self assert: ((a value)equalsTo: 27) .
self assert: (a eps equalsTo: (3 raisedTo: 3)*(3 ln +1)).


 