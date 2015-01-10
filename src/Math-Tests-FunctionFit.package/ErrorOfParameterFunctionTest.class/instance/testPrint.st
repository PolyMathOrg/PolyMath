tests
testPrint
|aStream  s|
aStream :=ReadWriteStream with:''.
f data:{(1@(1/2)). (2@(2/3)). (3@(3/4))} .
f printOn: aStream .
s :=aStream contents .
self assert: ('a * x / (b + x)' search: s).
self assert: ('squared' search: s).
self assert: ('false' search: s).

