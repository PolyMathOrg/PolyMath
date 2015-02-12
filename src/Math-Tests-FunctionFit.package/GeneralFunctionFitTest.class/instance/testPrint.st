tests
testPrint
|aStream s|
fit:=GeneralFunctionFit function: f data: col minimumValues: 0 maximumValues: 5 .
aStream :=ReadWriteStream with:''.
fit printOn: aStream .
s :=aStream contents .
self assert: (s includesSubstring: '(a * x) sin / (b + x squared)').
self assert: (s includesSubstring: '#squared').
self assert: (s includesSubstring: '81').
self deny: (s includesSubstring: '#(0.').
fit evaluate .
aStream :=ReadWriteStream with:''.
fit printOn: aStream .
s :=aStream contents .
self assert: (s includesSubstring: '#(0.').