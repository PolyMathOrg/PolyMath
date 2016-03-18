tests - accessing
testMidPoint
self assert: empty midPoint isNaN  .
self assert: o midPoint =1  .
self assert: (RealInterval fromNumber: -3.07) midPoint = -3.07.
self assert: d midPoint =(7/2).
self assert: (h midPoint closeTo:0).
self assert: (a midPoint = 1).
self assert: (a negated midPoint = -1).
self assert: (e midPoint = -1).
self assert: (g midPoint = 20).
self assert: (g negated midPoint = -20).
g inf: -2.
self assert: (g midPoint = 0).
self assert: (g negated midPoint = 0).
