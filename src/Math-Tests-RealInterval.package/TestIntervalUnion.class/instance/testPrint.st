tests-rest
testPrint
|aStream|
aStream :=ReadWriteStream with:''.
x printOn: aStream .
self assert: (aStream contents= 'an IntervalUnion([(-5/4),(-3/4)]u[0,0]u[2,Float infinity])').
