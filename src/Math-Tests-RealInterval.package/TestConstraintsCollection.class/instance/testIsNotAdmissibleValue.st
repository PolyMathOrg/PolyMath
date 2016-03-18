tests
testIsNotAdmissibleValue
|e c|
c:=ConstraintsCollection new.
self assert: (c isNotAdmissibleValue: '140.5')not.
c add: Constraint new.
self assert: (c isNotAdmissibleValue: 2).
self assert: (c isNotAdmissibleValue: -2)not.
self assert: (c isNotAdmissibleValue: 0)not.
self assert: (c isNotAdmissibleValue: (RealInterval inf: 0 sup:1)) not.
e:=Constraint new.
e min: -2.
c add:e.
self assert: (c isNotAdmissibleValue: 2).
self assert: (c isNotAdmissibleValue: -2)not.
self assert: (c isNotAdmissibleValue: -3).
self assert: (c isNotAdmissibleValue: (RealInterval inf: 0 sup:1))not.
self assert: (c isNotAdmissibleValue: (RealInterval inf: -3 sup:1))not.
self assert: (c isNotAdmissibleValue: (RealInterval inf: -4 sup: -1))not.
self assert: (c isNotAdmissibleValue: (RealInterval inf: -2 sup:0))not.
self assert: (c isNotAdmissibleValue: (RealInterval inf: -3 sup: -2.5)).
