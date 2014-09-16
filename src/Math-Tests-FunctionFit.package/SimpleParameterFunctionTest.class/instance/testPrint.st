tests
testPrint
|aStream s|
aStream :=ReadWriteStream with:''.
s:=SimpleParameterFunction function:f parameters: #(1 2 3).
s printOn: aStream .
s :=aStream contents .
self assert: ((s findString: 'a SimpleParameterFunction')=1).
self assert: ((s findString: '1')>0).
self assert: ((s findString: ' 2')>0).
self assert: ((s findString: ' 3')>0).
