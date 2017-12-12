printing
print2On: aStream 
	aStream nextPutAll: ' otherDataSize: '.
	compareWith ifNil:[aStream nextPut: $-]ifNotNil:[compareWith size printOn: aStream].
	aStream nextPut: $).
