tests
testAdmissibleNumberForValue
|e c|
c:=ConstraintsCollection new.
self assert: (c admissibleNumberForValue: '140.5')= 2.
c add: Constraint new.
self assert: (c admissibleNumberForValue: 2)= 0.
self assert: (c admissibleNumberForValue: -2)= 2.
self assert: (c admissibleNumberForValue: 0)= 2.
self assert: (c admissibleNumberForValue: (RealInterval inf: 0 sup:1)) = 1.
e:=Constraint new.
e min: -2.
c add:e.
self assert: (c admissibleNumberForValue: 2)= 0.
self assert: (c admissibleNumberForValue: -2)= 2.
self assert: (c admissibleNumberForValue: -3)= 0.
self assert: (c admissibleNumberForValue: (RealInterval inf: 0 sup:1)) = 1.
self assert: (c admissibleNumberForValue: (RealInterval inf: -3 sup:1)) = 1.
self assert: (c admissibleNumberForValue: (RealInterval inf: -4 sup: -1)) = 1.
self assert: (c admissibleNumberForValue: (RealInterval inf: -2 sup:0)) = 2.
self assert: (c admissibleNumberForValue: (RealInterval inf: -3 sup: -2.5)) = 0.
