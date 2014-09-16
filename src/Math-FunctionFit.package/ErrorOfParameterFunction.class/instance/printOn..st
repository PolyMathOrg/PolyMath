printing
printOn: aStream
	super printOn: aStream.  
	aStream 
		nextPutAll: '( function: '; print: function;
		nextPutAll: ' relativeError: '; print: relative;
		nextPutAll: ' errorType: '; print: errorType.
	(#(#quartile #insensitive) includes: errorType)ifTrue:[
		aStream nextPutAll: ' withQuartile: '; print: quartile].
	aStream nextPut: $).   