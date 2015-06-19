tests
testBitReverse
self should: [ 1 bitReverse: 0 ] raise: Error .
self should: [ 2 bitReverse: 1 ] raise: Error .
self assert: (0 bitReverse: 0) =0.
self assert: (1 bitReverse: 1) =1.
self assert: (1 bitReverse: 3) =4.
self assert: (4 bitReverse: 3) =1.
self assert: (5 bitReverse: 3) =5.
self assert: (5 bitReverse: 4) =10.
self assert: (5 bitReverse: 17) =((2 raisedTo: 16)+(2 raisedTo: 14)).
self assert: ((17 bitReverse: 17)bitReverse: 17) =17.
