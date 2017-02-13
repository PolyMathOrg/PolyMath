printing
print1On: aStream 
	super printOn: aStream .
	aStream nextPutAll: '(dataSize: '.
	data ifNil:[aStream nextPut: $-]ifNotNil:[data size printOn: aStream].
