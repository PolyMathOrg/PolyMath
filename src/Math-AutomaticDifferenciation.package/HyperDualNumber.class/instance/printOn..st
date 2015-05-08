printing
printOn: aStream 
	"Append a sequence of characters that identify the receiver to aStream."
aStream
	nextPutAll: self class name;
	nextPutAll: '(value: ' ;
	print: value ;
	nextPutAll:' eps1: ';
	print: eps;
	nextPutAll: ' eps2: ' ;
	print: eps2  ;
	nextPutAll:' eps12: ';
	print: eps1eps2;
	nextPutAll:')'.