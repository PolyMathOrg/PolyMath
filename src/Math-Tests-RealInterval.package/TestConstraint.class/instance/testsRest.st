tests
testsRest
|a b|
a:=Constraint new.
self  assert:(a block value:4)=4.
self  assert:a admissibleImage  =(RealInterval inf: Float infinity negated  sup: 0).
b:=Constraint block: [ :x|2-x].
b:=Constraint block: [ :x|1-x] image:RealInterval entire.
self  assert:(b block value: 4)= -3.
self  assert:b admissibleImage  =RealInterval entire.
self  assert: (b isAdmissibleValue:4).
self  assert: (b isPerhapsAdmissibleValue:4).
b admissibleImage: (RealInterval inf: -2 sup: 2).
self  deny: (b isAdmissibleValue:4).
self  deny: (b isPerhapsAdmissibleValue:4).
self  deny: (b isAdmissibleValue:(RealInterval inf: 3 sup: 4)).
self  assert: (b isPerhapsAdmissibleValue:(RealInterval inf: 3 sup: 4)).
a equalToNumber: 3.
a enlargeToWidth: 0.002. 
self assert: a admissibleImage =(RealInterval inf: 2.997 sup: 3.003).
self  assert: (a isAdmissibleValue:3.002).
self  deny: (a isAdmissibleValue:(RealInterval inf: 3 sup: 4)).
self  assert: (a isPerhapsAdmissibleValue:(RealInterval inf: 3 sup: 4)).
self  deny: (a isNotAdmissibleValue:(RealInterval inf: 3 sup: 4)).
self  assert: (a isNotAdmissibleValue:(RealInterval inf: 4 sup: 5)).
a max:3.
self  assert:a admissibleImage  =(RealInterval inf: Float infinity negated  sup: 3).
a min:3.
self  assert:a admissibleImage  =(RealInterval inf: 3 sup: Float infinity).

 