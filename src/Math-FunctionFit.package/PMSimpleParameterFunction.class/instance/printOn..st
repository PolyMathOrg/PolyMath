printing
printOn: aStream
	super printOn: aStream.  
	aStream nextPutAll: '( '; print: function .
	varArray ifNotNil:[ self parameterNames with: self parameters do: 
		[:n :p|aStream nextPutAll: ' '; nextPutAll: n; nextPutAll:': ';print: p. ]] .
	aStream nextPut: $).    