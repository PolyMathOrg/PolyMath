printing
storeOn: aStream
	aStream nextPut: $(; nextPutAll: self class name;
		nextPutAll: ' block: '; print: block ;
		nextPutAll: ' image: '; store: admissibleImage;
		nextPut: $)