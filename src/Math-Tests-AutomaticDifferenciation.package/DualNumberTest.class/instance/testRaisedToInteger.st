tests-mathematical functions
testRaisedToInteger
self assertEquality: (three raisedToInteger: 2) and: three squared.
self assertEquality: (three raisedToInteger: 1)and: three.
self assertEquality: (three raisedToInteger: 0)and: onec.
self assertEquality: (three raisedToInteger: 4)and: (PMDualNumber value: 81 eps: 108).
self assertEquality: (zero raisedToInteger: 4)and:zeroc.