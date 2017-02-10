printing
printOn: aStream
	"Append a sequence of characters that identify the receiver to aStream."

	aStream
		nextPutAll: self class name;
		nextPutAll: '(value: ';
		print: value;
		nextPutAll: ' eps: ';
		print: eps;
		nextPutAll: ')'