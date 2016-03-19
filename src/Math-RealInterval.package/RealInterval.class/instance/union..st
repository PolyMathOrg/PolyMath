set operations
union: anInt 
(anInt isNumber and:[anInt isRealInterval not]) ifTrue: [^self union: (RealInterval fromNumber: anInt) ] .
self isEmpty ifTrue: [^anInt ].
anInt isEmpty ifTrue: [^self ].
anInt isIntervalUnion ifTrue: [ ^anInt union:self ].
(inf> anInt sup) ifTrue: [^IntervalUnion  with: anInt with: self ].
anInt inf >sup ifTrue:[^IntervalUnion with: self with:anInt ].
^RealInterval inf: (inf min: anInt inf) sup:(anInt sup max: sup)
