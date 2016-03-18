tests - accessing
testCutPoint
self assert: empty cutPoint isNaN  .
self assert: o cutPoint isNaN  .
self assert: (RealInterval fromNumber: -3.07) cutPoint isNaN.
self assert: d cutPoint =0.
self assert: h cutPoint =0.
self assert: a cutPoint =1.
self assert: a negated  cutPoint = -1.
self assert: (e cutPoint closeTo: -0.96824584).
self assert: (RealInterval inf: 1 sup: 4) cutPoint =2.
self assert: g cutPoint =20.
self assert: g negated cutPoint = -20.
g inf: -2.
self assert: g cutPoint =0.
self assert: g negated cutPoint = 0.
