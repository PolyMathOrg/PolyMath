set operations
hull: anInt 
"this somewhat illogically accepts infinite numbers, which i found practically in some situations."
(anInt isNumber and:[anInt isRealInterval not]) ifTrue: 
	[^anInt isInfinite 
		ifFalse: [self hull: (RealInterval fromNumber: anInt)]
		ifTrue:[ RealInterval inf: (inf min: anInt) sup:(anInt max: sup)] ].
self isEmpty ifTrue: [^anInt ].
anInt isEmpty ifTrue: [^self ].
anInt isIntervalUnion ifTrue: [ ^anInt hull:self ].
^RealInterval inf: (inf min: anInt inf) sup:(anInt sup max: sup)
