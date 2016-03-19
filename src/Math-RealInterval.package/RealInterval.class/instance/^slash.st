arithmetic
/ anInt
(anInt isNumber and:[anInt isRealInterval not]) ifTrue: [^self / (RealInterval fromNumber: anInt) ].
anInt isIntervalUnion ifTrue:[^anInt adaptToNumber: self andSend: #/].
(anInt isEmpty or: [self isEmpty ]) ifTrue: [ ^RealInterval new ] .
(anInt isZeroInterval )ifTrue: [ ^RealInterval new comments:'zeroDivide';yourself].
self isMixed 
 ifTrue: [ 
	anInt isMixed 
	ifTrue: [^RealInterval entire  ] 
	ifFalse: [ anInt positive 
		ifTrue: [(anInt inf = 0) 
			ifTrue: [ ^RealInterval entire] 
			ifFalse: [^RealInterval inf: (self inf / anInt inf) sup: (self sup / anInt inf) ] ] 
		ifFalse:[(anInt sup=0)
			ifTrue: [ ^RealInterval entire ] 
			ifFalse:  [^RealInterval inf: (self sup / anInt sup) sup: (self inf / anInt sup) ] ] ] ]
 ifFalse: [
	self positive 
		ifTrue: [( inf=0)	"P0"
			ifTrue: [ anInt isMixed 
				ifTrue: [ ^RealInterval entire ] 
				ifFalse: [ anInt positive 
					ifTrue: [ (anInt inf=0) 
						ifTrue: [ ^RealInterval inf: 0 sup: Float infinity ] 
						ifFalse: [ ^RealInterval inf: 0 sup: (self sup / anInt inf) ]  ] 
					ifFalse: [ (anInt sup=0)	"anInt isNegative"
						ifTrue: [ ^RealInterval inf: Float infinity negated sup: 0 ] 
						ifFalse: [ ^RealInterval inf: (self sup/anInt sup) sup: 0 ]  ]  ] ] 
			ifFalse:[ anInt isMixed 			"P1"
				ifTrue: [ ^(RealInterval inf: Float infinity negated sup: (self inf/anInt inf))union: 
					 (RealInterval inf: (self inf/anInt sup) sup: Float infinity) ] 
				ifFalse:[ anInt positive 
					ifTrue: [(anInt inf=0)
						ifTrue: [ ^RealInterval inf: (self inf/anInt sup) sup: Float infinity ] 
						ifFalse: [ ^RealInterval inf: (self inf/anInt sup) sup: (sup/anInt inf) ]  ] 
					ifFalse:[(anInt sup=0)	"anInt isNegative"
						ifTrue: [ ^RealInterval inf: Float infinity negated sup: (inf/anInt inf) ]
						 ifFalse: [ ^RealInterval inf: (sup/anInt sup) sup: (inf/anInt inf) ] ] ] ] ]
		ifFalse: [self negative 
		  ifTrue: [( sup=0)	"N0"
			ifTrue: [ anInt isMixed 
				ifTrue: [ ^RealInterval entire ] 
				ifFalse: [ anInt positive 
					ifTrue: [ (anInt inf=0) 
						ifTrue: [ ^RealInterval inf: Float infinity negated sup: 0 ] 
						ifFalse: [ ^RealInterval inf: (inf / anInt inf) sup: 0 ]  ] 
					ifFalse: [ (anInt sup=0)	"anInt isNegative"
						ifTrue: [ ^RealInterval inf:  0 sup: Float infinity ] 
						ifFalse: [ ^RealInterval inf: 0 sup: (inf/anInt sup) ]  ]  ] ] 
			ifFalse:[ anInt isMixed 			"N1"
				ifTrue: [ ^(RealInterval inf: Float infinity negated sup: (sup/anInt sup))union: 
						(RealInterval inf: (sup/anInt inf) sup: Float infinity) ] 
				ifFalse:[ anInt positive 
					ifTrue: [(anInt inf=0)
						ifTrue: [ ^RealInterval inf: Float infinity negated sup: (sup/anInt sup) ] 
						ifFalse: [ ^RealInterval inf: (inf/anInt inf) sup: (sup/anInt sup) ]  ] 
					ifFalse:[(anInt sup=0)	"anInt isNegative"
						ifTrue: [ ^RealInterval inf: (sup/anInt inf)  sup: Float infinity  ]
						 ifFalse: [ ^RealInterval inf: (sup/anInt inf) sup: (inf/anInt sup) ] ] ] ]]
		 ]].
