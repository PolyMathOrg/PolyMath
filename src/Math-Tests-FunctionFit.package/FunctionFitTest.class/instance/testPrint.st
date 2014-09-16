tests
testPrint
|aStream ff s|
aStream :=ReadWriteStream with:''.
ff:=  FunctionFit function: f data: d .
ff printOn: aStream .
s :=aStream contents .
self assert: ((s findString: 'a * x / (b + x)')>0).
self assert: ((s findString: '20')>0).

