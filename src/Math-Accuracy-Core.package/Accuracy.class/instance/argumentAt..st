accessing
argumentAt: aName
	| ar |
	ar := arguments at: aName ifAbsent: [ arguments at: 'AllTheRest' ifAbsent: [ nil ] ].
	(ar isCollection and: [ ar isEmpty ])
		ifTrue: [ ar := nil ].
	^ ar