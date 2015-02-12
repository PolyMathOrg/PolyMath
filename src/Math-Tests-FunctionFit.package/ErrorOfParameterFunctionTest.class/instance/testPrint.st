tests
testPrint
|aStream  s|
aStream :=ReadWriteStream with:''.
f data:{(1@(1/2)). (2@(2/3)). (3@(3/4))} .
f printOn: aStream .
s :=aStream contents .
self assert: (s includesSubstring: 'a * x / (b + x)').
self assert: (s includesSubstring: 'squared').
self assert: (s includesSubstring: 'false').

