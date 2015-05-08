tests-mathematical functions
testRaisedTo
|a |
self assert: ((three raisedTo: 2) equalsTo: three squared).
self assertEquality: (three raisedTo: 0) and: onec.
self assert: (((three + one) raisedTo: 1/2) equalsTo: (HyperDualNumber value: 2 eps: 1/2 eps2:1/2 eps1eps2: -1/8)).
self assertEquality: (zero raisedTo: 1.4)and:zeroc.
a:=2 raisedTo: three.
self assert: ((a value)equalsTo: 8) .
self assert: (a eps equalsTo: (2 ln* (2 raisedTo: 3))).
self assertEquality: (1 raisedTo: three)and:onec.
self assert: ((one raisedTo: one)equalsTo:  (HyperDualNumber value: 1 eps: 1 eps2: 1 eps1eps2: 2)).
a:=three raisedTo: three.
self assert: ((a value)equalsTo: 27) .
self assert: (a eps equalsTo: (3 raisedTo: 3)*(3 ln +1)).


 