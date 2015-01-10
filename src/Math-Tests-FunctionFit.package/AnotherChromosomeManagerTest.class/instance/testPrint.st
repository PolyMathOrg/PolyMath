tests
testPrint
|aStream  s|
aStream :=ReadWriteStream with:''.
cm printOn: aStream .
s :=aStream contents .
self assert: ('#(0 1)' search: s).
self assert: ('#(2 3)' search: s).
