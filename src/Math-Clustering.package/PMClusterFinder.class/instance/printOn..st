printing
printOn: aStream
	
	aStream nextPutAll: 'Iterations: '.
	iterations printOn: aStream.
	result do: [ :each | aStream cr. each printOn: aStream ]