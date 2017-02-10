running
run: anArrayOfNames
	|a|
	a := self asArray: anArrayOfNames.
	(names includesAll: a) ifFalse: [ NotFound signalFor: a in: names ].
	aStream reset;
		<< 'Report for: ';
		<< self class name;
		cr.
	self ifSeveralterations: [ aStream << 'iterations: '	<< iterations; cr ].
	(self tree: dataTree removeAll type: self class name data: 'names')
		at: 'iterations' put: iterations;
		at: 'names' put: (self tree: KeyedTree new type: 'names' data: a).
	self displayProgress: a.
	^ aStream contents