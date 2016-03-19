printing
printOn: aStream
	self isEmpty ifTrue: [ ^aStream nextPutAll: '[empty]' ].
	aStream nextPut: $[.
	inf printOn: aStream.
	aStream nextPut: $,.
	sup printOn: aStream.
	aStream nextPut: $].