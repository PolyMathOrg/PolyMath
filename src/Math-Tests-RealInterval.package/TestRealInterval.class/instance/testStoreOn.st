tests-rest
testStoreOn
|aStream|
aStream :=ReadWriteStream with:''.
c storeOn: aStream .
self assert: (Compiler evaluate: aStream contents)= c.
aStream reset .
empty storeOn: aStream .
self assert: (Compiler evaluate: aStream contents)= empty.

