arithmetic
\\ aNumber 
	"modulo. Remainder defined in terms of //. Answer a Number with the 
	same sign as aNumber. at the moment aNumber cant be an interval but this should be changed"

|barrier n bplusn|
self isEmpty ifTrue: [ ^RealInterval new ].
(aNumber isNumber not or:[aNumber isRealInterval ])ifTrue:[self error].
n:=aNumber abs.
self width>=n ifTrue: [ ^(aNumber >0) ifTrue: [ RealInterval inf: 0 sup: aNumber ] ifFalse:[ RealInterval inf: aNumber sup:0 ] ].
barrier :=(inf//aNumber * aNumber) .
bplusn :=barrier +n.
^aNumber >=0 
	ifTrue: [(bplusn <= sup ) 
		ifTrue: [ (RealInterval inf: (inf - barrier)   sup:  aNumber  ) union: (RealInterval inf:  0 sup:( sup - bplusn ) )] 
		ifFalse:[ RealInterval inf: inf - barrier  sup: sup - barrier ].]
	ifFalse: [(barrier < sup ) 
		ifTrue: [ (RealInterval inf: (inf - barrier )   sup:  0  ) union: (RealInterval inf:  aNumber sup:( sup - bplusn ) )] 
		ifFalse:[ RealInterval inf: inf - barrier  sup: sup - barrier ].]