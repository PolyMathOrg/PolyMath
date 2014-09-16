tests
testPrint
|aStream  s|
aStream :=ReadWriteStream with:''.
cm printOn: aStream .
s :=aStream contents .
self assert: ((s findString: '#(0 1)')>0).
self assert: ((s findString: '#(2 3)')>0).
