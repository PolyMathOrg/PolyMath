printing
printOn: aStream
      super printOn: aStream .
	aStream nextPutAll:  ' (dim: ';
	 print: dim ;
	 nextPutAll:  ' value: ';
	 print: value ;
	 nextPutAll: ' left: ';
	 print: left ;
	 nextPutAll: ' right: '; 
	 print: right ;
	 nextPut: $) .