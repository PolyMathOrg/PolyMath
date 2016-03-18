tests
testIsPartlyAdmissibleValue
|e c|
c:=ConstraintsCollection new.
self assert: (c isPerhapsAdmissibleValue: '140.5').
c add: Constraint new.
self assert: (c isPerhapsAdmissibleValue: 2)not.
self assert: (c isPerhapsAdmissibleValue: -2).
self assert: (c isPerhapsAdmissibleValue: 0).
self assert: (c isPerhapsAdmissibleValue: (RealInterval inf: 0 sup:1)).
e:=Constraint new.
e min: -2.
c add:e.
self assert: (c isPerhapsAdmissibleValue: 2)not.
self assert: (c isPerhapsAdmissibleValue: -2).
self assert: (c isPerhapsAdmissibleValue: -3)not.
self assert: (c isPerhapsAdmissibleValue: (RealInterval inf: 0 sup:1)).
self assert: (c isPerhapsAdmissibleValue: (RealInterval inf: -3 sup:1)).
self assert: (c isPerhapsAdmissibleValue: (RealInterval inf: -4 sup: -1)).
self assert: (c isPerhapsAdmissibleValue: (RealInterval inf: -2 sup:0)).
self assert: (c isPerhapsAdmissibleValue: (RealInterval inf: -3 sup: -2.5))not.
