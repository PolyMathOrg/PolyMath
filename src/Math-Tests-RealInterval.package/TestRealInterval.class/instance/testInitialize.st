tests-rest
testInitialize
|f|
f:=a class consistsOfFloatsOnly.
a class consistsOfFloatsOnly: true.
self assert: b class consistsOfFloatsOnly .
b class initialize.
self deny: b class consistsOfFloatsOnly .
a class consistsOfFloatsOnly:f.
