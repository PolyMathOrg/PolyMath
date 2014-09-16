tests
testPrint
|aStream  s|
aStream :=ReadWriteStream with:''.
f printOn: aStream .
s :=aStream contents .
self assert: ((s findString: 'a * x / (b + x)')>0).
self assert: ((s findString: '#squared')>0).
self assert: ((s findString: 'maxFunction: ', f maxFunction asString )>0).

