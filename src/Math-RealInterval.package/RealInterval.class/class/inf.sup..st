instance creation
inf: aNumber sup: anotherN
^(aNumber isNaN or: [ anotherN isNaN or:[ aNumber isInfinite and:  [aNumber =anotherN ]]])
	ifTrue: [ self new ] 
	ifFalse: [super new inf: aNumber;sup: anotherN;yourself ]