printing
storeOn: aStream
	aStream nextPut: $(; nextPutAll: self class name;
		nextPutAll: ' inf: '; store: inf ;
		nextPutAll: ' sup: '; store: sup;
		nextPut: $)