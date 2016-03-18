tests - testing
testIsInteger
self deny: empty isAnInteger.
self deny: a isAnInteger.
self deny: d isAnInteger.
self deny: h isAnInteger.
self assert: o isAnInteger .
self assert: z isAnInteger .
self assert: (RealInterval fromNumber: -1.0) isAnInteger .
self deny: (RealInterval fromNumber: 1.01) isAnInteger .
