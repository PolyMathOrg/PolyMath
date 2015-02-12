tests
testPrint
|aStream  s|
aStream :=ReadWriteStream with:''.
cm printOn: aStream .
s :=aStream contents .
self assert: (s includesSubstring: '#(0 1)').
self assert: (s includesSubstring: '#(2 3)').
