tests
testPrint
|aStream s|
aStream :=ReadWriteStream with:''.
s:=SimpleParameterFunction function:f parameters: #(1 2 3).
s printOn: aStream .
s :=aStream contents .
self assert: ((s findString: 'a SimpleParameterFunction')=1).
self assert: ('1' search: s).
self assert: (' 2' search: s).
self assert: (' 3' search: s).
