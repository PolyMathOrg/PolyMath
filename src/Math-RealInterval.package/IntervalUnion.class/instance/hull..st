set operations
hull: anInt
"this somewhat illogically accepts infinite numbers, which i found practically in some situations."
|r|
self isEmpty ifTrue: [ ^anInt isNumber ifTrue: [ RealInterval fromNumber: anInt  ] ifFalse:[anInt ]].
anInt isNumber ifTrue: 
	[^RealInterval inf:(anInt asNumber min: self inf) sup:(anInt asNumber max: self sup)].
r := self union: anInt.
r isEmpty ifTrue: [ ^RealInterval new ].
^RealInterval inf: r inf sup: r sup