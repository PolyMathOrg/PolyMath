tests - converting
testEnlargeToWidth
self assert: (i copy enlargeToWidth: 0.8)=i.
self assert: (x copy enlargeToWidth: 1/2)=(IntervalUnion with: g with: (RealInterval inf: (-1/4) sup: (1/4)) with:e).
self assert: (x copy enlargeToWidth: 1) =(IntervalUnion with: g with: (RealInterval inf: (-1.5) sup: (1/2))) .
(x enlargeToWidth: Float infinity ).
self assert: x=(IntervalUnion with: b).
self assert: (x copy enlargeToWidth: 1/2)=(IntervalUnion with: b).
