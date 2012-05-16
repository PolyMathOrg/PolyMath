display
printOn: aStream
		"(c) Copyrights Didier BESSET, 2000, all rights reserved.
		 Initial code: 2/16/00 "
	aStream nextPutAll: 'Iterations: '.
	iterations printOn: aStream.
	result do: [ :each | aStream cr. each printOn: aStream].