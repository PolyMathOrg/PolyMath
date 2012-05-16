printing
storeOn: aStream 
	"Store a representation of the receiver onto aStream that can be interpreted.
	Two possible forms are:
	a + b i + c j + d k
	a i: b j: c k: d
	Second one is preferred for efficiency"

	aStream nextPut: $(.
	qr storeOn: aStream.
	aStream
		space;
		nextPutAll: #i:;
		space.
	qi storeOn: aStream.
	aStream
		space;
		nextPutAll: #j:;
		space.
	qj storeOn: aStream.
	aStream
		space;
		nextPutAll: #k:;
		space.
	qk storeOn: aStream.
	aStream nextPut: $)