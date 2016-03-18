tests
testAdmissibleNumberForValue
|c |
c:=Constraint new.
self assert: (c admissibleNumberForValue: 2)= 0.
self assert: (c admissibleNumberForValue: -2)= 2.
self assert: (c admissibleNumberForValue: 0)= 2.
self assert: (c admissibleNumberForValue: (RealInterval inf: 0 sup:1)) = 1.
