tests
testPrint
|aStream  s|
aStream :=ReadWriteStream with:''.
f printOn: aStream .
s :=aStream contents .
self assert: ('a * x / (b + x)' search: s).
self assert: ('#squared' search: s).
self assert: ('maxFunction: ', f maxFunction asString search: s).

