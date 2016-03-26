tests
testBug1
| r |
optimizer addPointAt: #(2 3).
optimizer addPointAt: #(2 3).
self shouldnt: [r:=optimizer randomScale] raise: Error.
self assert: ( r first equalsTo: (1/2) ).
self assert: ( r last equalsTo: 1).