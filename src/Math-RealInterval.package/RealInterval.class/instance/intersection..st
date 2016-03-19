set operations
intersection: anInt 
"at the moment not dependent on onlyfloats as this would introduce bugs. should be done very carefully, if at all"
|l u|
(anInt isNumber and:[anInt isRealInterval not]) ifTrue:[
	^(anInt between: inf and: sup) 
		ifTrue:[anInt ]  
		ifFalse: [ RealInterval new ] ].
(self isEmpty or: [anInt isEmpty])ifTrue: [^RealInterval new ].
anInt isIntervalUnion ifTrue:[^anInt adaptToNumber: self andSend: #intersection:].
l:=(inf max: anInt inf).
u:=(sup min: anInt sup).
^ l <= u ifTrue: [ RealInterval inf: l sup: u ] ifFalse:[RealInterval new] 
