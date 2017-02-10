printing
printOn: aStream base: base 
	aStream
		nextPut: $(;
		nextPutAll: self class name;
		space;
		nextPutAll: #readFrom:;
		space;
		nextPut: $'.
	self negative ifTrue: [aStream nextPut: $-].
	self absPrintExactlyOn: aStream base: base.
	aStream
		nextPut: $';
		space;
		nextPutAll: #readStream;
		space;
		nextPutAll: #numBits:;
		space;
		print: nBits;
		nextPut: $)