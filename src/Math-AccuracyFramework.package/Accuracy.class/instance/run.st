running
run
	aStream reset;
		<< 'Report for: ';
		<< self class name;
		cr.
	self ifSeveralterations: [ aStream << 'iterations: '	<< iterations; cr ].
	(self tree: dataTree removeAll type: self class name data: 'names')
		at: 'iterations' put: iterations;
		at: 'names' put: (self tree: KeyedTree new type: 'names' data: names).
	self displayProgress.
	^ aStream contents