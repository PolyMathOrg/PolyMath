printing
printOn: aStream
	aStream nextPutAll:  'KDTree (dim: ';
	 print: dim ;
	 nextPutAll:  ' value: ';
	 print: value ;
	 nextPutAll: ' left: ';
	 print: left ;
	 nextPutAll: ' right: '; 
	 print: right ;
	 nextPut: $) .