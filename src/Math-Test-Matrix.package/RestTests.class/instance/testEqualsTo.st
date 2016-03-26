tests
testEqualsTo
|a b|
a:=DhbMatrix rows: 5 columns: 7 random: 5.0 .
b:=a deepCopy.
self assert: (a equalsTo: b).
b rowAt: 4 columnAt: 6 put: 6.
self deny: (a equalsTo: b).


