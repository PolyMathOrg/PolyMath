tests - accessing
testWidth
self assert: b width= Float infinity .
self assert: g width= Float infinity .
self assert: h width= Float infinity .
self assert: d width= 9 .
self assert: e width= (1/2) .
self assert: o width= 0 .
self assert: empty width isNaN  .
