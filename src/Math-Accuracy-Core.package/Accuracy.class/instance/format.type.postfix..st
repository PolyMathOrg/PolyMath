printing
format: aCollection type: aString postfix: pf
	| c |
	c := self format: aCollection.
	aStream << aString <<': '<< (c joinUsing: (pf ifNil: [ ' , ' ] ifNotNil: [ pf , ' , ' ])).
	pf ifNotNil: [ aStream << pf ].
	^aStream space.