tests
testPrint
|aStream s|
fit:=GeneralFunctionFit function: f data: col minimumValues: 0 maximumValues: 5 .
aStream :=ReadWriteStream with:''.
fit printOn: aStream .
s :=aStream contents .
self assert: ('(a * x) sin / (b + x squared)' search: s).
self assert: ('#squared' search: s).
self assert: ('81' search: s).
self deny: ('#(0.' search: s).
fit evaluate .
aStream :=ReadWriteStream with:''.
fit printOn: aStream .
s :=aStream contents .
self assert: ('#(0.' search: s).