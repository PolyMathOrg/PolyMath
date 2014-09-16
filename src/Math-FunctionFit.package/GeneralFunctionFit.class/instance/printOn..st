printing
printOn: aStream
	aStream
		nextPutAll: 'a ';
		nextPutAll: self class name;
		nextPut: $(;
		print: go;
		nextPutAll: ' with data of size: ';
	  	print: data size .
	 dataTruncated ifTrue: 
		[aStream nextPutAll: ' truncated to: '; print: self optimizer functionBlock data size] .
       aStream nextPut: $).