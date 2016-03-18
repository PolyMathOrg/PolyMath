tests
testPrint
|aStream |
aStream :=ReadWriteStream with:''.
BoxSplicing new printOn: aStream .
self assert: (aStream contents= 'a BoxSplicing(box: nil constraints: a ConstraintsCollection())').
