tests
testPrint
|aStream  s|
aStream :=ReadWriteStream with:''.
go printOn: aStream .
s :=aStream contents .
self assert: (s includesSubstring: 'v * v').
self assert: (s includesSubstring: '50').
self assert: (s includesSubstring: '20').