tests
testPrint
|aStream  s|
aStream :=ReadWriteStream with:''.
f printOn: aStream .
s :=aStream contents .
self assert: (s includesSubstring: 'a * x / (b + x)').
self assert: (s includesSubstring: '#squared').
self assert: (s includesSubstring: 'maxFunction: ', f maxFunction asString).

