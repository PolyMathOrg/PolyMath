printing
printOn: aStream 
	aStream
		nextPutAll: self class name;
		nextPutAll: ' of: ' ;
		print: function 