tests
testPrint
|aStream  s|
aStream :=ReadWriteStream with:''.
go printOn: aStream .
s :=aStream contents .
self assert: ((s findString: 'v * v')>0).
self assert: ((s findString: '50')>0).
self assert: ((s findString: '20')>0).