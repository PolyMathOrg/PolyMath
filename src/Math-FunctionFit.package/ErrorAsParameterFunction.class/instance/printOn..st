printing
printOn: aStream
	aStream
		nextPutAll: 'an ';
		nextPutAll: self class name;
		nextPutAll: '( function: ';
		print: (function ifNil: [ nil ] ifNotNil: [ :f | f first ]);
		nextPutAll: ' maxFunction: ';
		print: self maxFunction.
	varArray
		ifNotNil: [ aStream
				nextPutAll: ' parameters: ';
				print: self parameters ].
	aStream nextPut: $)