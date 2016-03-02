accessing
parameterAt: aName
	| par |
	par := parameters at: aName ifAbsent: [ parameters at: 'AllTheRest' ifAbsent: [ nil ] ].
	(par isCollection and: [ par isEmpty ])
		ifTrue: [ par := nil ].
	^ par 