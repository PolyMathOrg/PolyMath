tests
testPrint
|aStream s fit|
fit:=GeneralFunctionFit function: f data: col minimumValues: 0 maximumValues: 5 .
aStream :=ReadWriteStream with:''.
fit printOn: aStream .
s :=aStream contents .
self assert: ((s findString: '(a * x) sin / (b + x squared)')>0).
self assert: ((s findString: '#squared')>0).
self assert: ((s findString: '81')>0).
self assert: ((s findString: '#(0.')=0).
fit evaluate .
aStream :=ReadWriteStream with:''.
fit printOn: aStream .
s :=aStream contents .
self assert: ((s findString: '#(0.')>0).