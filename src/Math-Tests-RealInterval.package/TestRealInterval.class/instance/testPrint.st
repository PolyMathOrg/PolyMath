tests-rest
testPrint
|aStream|
aStream :=ReadWriteStream with:''.
c printOn: aStream .
empty printOn: aStream .
self assert: (aStream contents= '[1,7][empty]').
