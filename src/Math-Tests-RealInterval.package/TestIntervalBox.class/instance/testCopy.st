tests
testCopy
|y |
y:=x copy.
(y at:1)inf: -122.
self assert: (x at:1) inf= -2.
self assert: (y at:1) inf= -122.
