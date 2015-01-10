tests
testPrint
|aStream ff s|
aStream :=ReadWriteStream with:''.
ff:=  FunctionFit function: f data: d .
ff printOn: aStream .
s :=aStream contents .
self assert: ('a * x / (b + x)' search: s).
self assert: ('20' search: s).

