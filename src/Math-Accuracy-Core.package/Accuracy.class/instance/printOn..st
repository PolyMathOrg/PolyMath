printing
printOn: aStream1
	super printOn: aStream1.
	self report
		ifEmpty: [ aStream1 nextPutAll: ' ()' ]
		ifNotEmpty: [ :c | 
			aStream1
				nextPutAll:
					' (
';
				nextPutAll: c;
				nextPutAll: ' )' ]