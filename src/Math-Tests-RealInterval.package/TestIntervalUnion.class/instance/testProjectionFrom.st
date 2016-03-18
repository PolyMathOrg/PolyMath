tests - accessing
testProjectionFrom
self assert: (i projectionFrom:0) isNaN  .
self assert: (x projectionFrom:Float nan) isNaN  .
self assert: (x projectionFrom:Float infinity )=Float infinity .
x sup: 3.5.
self assert: (x projectionFrom:(170/4))=3.5 asFraction .
self assert: (x projectionFrom:3)=3.
self assert: (x projectionFrom: 1.5)=2.0.
self assert: (x projectionFrom: -0.1)=0.
self assert: (x projectionFrom: -0.5)=(-3/4)asFloat .
self assert: (x projectionFrom: -2)= -1.
self assert: (x projectionFrom: -2.0)=(-5/4)asFloat .
x:=IntervalUnion with: (0.1 hull:0.5) with: (0.6 hull: 0.7 ) with: (0.9 hull: 2) with: (3.3 hull:3.4).
self assert: (x projectionFrom: -2)= 1.
self assert: (x projectionFrom: 4)= 2.
self assert: (x projectionFrom: 3)= 2.
self assert: (x projectionFrom: 3.0)=  3.3.
self assert: (x projectionFrom: 0.79)=  0.7.
self assert: (x projectionFrom: 0.81)=  0.9.