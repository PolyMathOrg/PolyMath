tests - accessing
testProjectionFrom
|r |
self assert: (empty projectionFrom:0) isNaN  .
self assert: (a projectionFrom:Float nan) isNaN  .
self assert: (a projectionFrom:Float infinity ) =Float infinity .
r:=o projectionFrom:20.
self assert: r=1  .
self assert: r isInteger.
r:=o projectionFrom: -3.0.
self assert: r=1  .
self assert: r isFloat.
c:=RealInterval fromNumber: -3.07.
self assert: (c projectionFrom: Float infinity negated) = -3.07.
self assert: (c projectionFrom: 6) isNaN .
r:= c projectionFrom: 1/8 .
self assert: r isFraction.
self assert: r= -3.07.
self assert: (e projectionFrom:7.8) = -0.75.
self assert: (e projectionFrom: -7) = -1.
self assert: (e projectionFrom: 7) = -1.
self assert: (e projectionFrom: (-7/2)) =  (-5/4).
c sup: -3.06.
self assert: (c projectionFrom: 6) isNaN .
self assert: (c projectionFrom: Float infinity) = -3.06.
