tests
testPrint
|aStream ff s|
aStream :=ReadWriteStream with:''.
ff:=  PMFunctionFit function: f data: d .
ff printOn: aStream .
s :=aStream contents .
self assert: (s includesSubstring: 'a * x / (b + x)').
self assert: (s includesSubstring: '20').

