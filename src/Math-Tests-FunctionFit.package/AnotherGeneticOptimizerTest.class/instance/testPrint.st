tests
testPrint
|aStream  s|
aStream :=ReadWriteStream with:''.
go printOn: aStream .
s :=aStream contents .
self assert: ('v * v' search: s).
self assert: ('50' search: s).
self assert: ('20' search: s).