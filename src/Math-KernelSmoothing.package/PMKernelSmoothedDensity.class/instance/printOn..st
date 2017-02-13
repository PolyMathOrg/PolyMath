printing
printOn: aStream
   aStream nextPutAll: self class distributionName.
	aStream nextPutAll:  ' (dataSize: ';
	 print: (data isCollection ifTrue:[data size]ifFalse:[0]) ;
	 nextPutAll:  ' kernel: ';
	 print: (kernelName='unknown' ifTrue:[kernel]ifFalse: [kernelName]);
	 nextPutAll: ' bandWidth: ';
	 print: bandwidth ;
	 nextPut: $) .