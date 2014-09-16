tests
testPrint
|aStream  s|
aStream :=ReadWriteStream with:''.
f data:{(1@(1/2)). (2@(2/3)). (3@(3/4))} .
f printOn: aStream .
s :=aStream contents .
self assert: ((s findString: 'a * x / (b + x)')>0).
self assert: ((s findString: 'squared')>0).
self assert: ((s findString: 'false')>0).

