arithmetic
* anInt
|c|
(anInt isNumber and:[anInt isRealInterval not]) ifTrue: [^self * (RealInterval fromNumber: anInt) ] .
anInt isIntervalUnion ifTrue:[^anInt adaptToNumber: self andSend: #*].
(anInt isEmpty or: [self isEmpty ]) ifTrue: [ ^RealInterval new ] .
(self isZeroInterval or:[anInt isZeroInterval ])ifTrue: [ ^RealInterval inf: 0 sup: 0 ].
self isMixed 
 ifTrue: [ 
	anInt isMixed 
	ifTrue: [
		c:={inf * anInt inf. sup * anInt inf. inf * anInt sup. sup * anInt sup}.
		^RealInterval inf: c min sup: c max  ] 
	ifFalse: [ anInt positive 
		ifTrue: [
			 ^RealInterval inf: (self inf * anInt sup) sup: (self sup *anInt sup) ] 
		ifFalse:[
			 ^RealInterval inf: (self sup * anInt inf) sup: (self inf *anInt inf) ] ]] 
 ifFalse: [
	self positive 
		ifTrue: [ anInt isMixed ifTrue: [ ^anInt * self ] ifFalse: [ anInt positive
				 ifTrue: [ ^RealInterval inf: (self inf * anInt inf) sup: (self sup *anInt sup) ] 
				 ifFalse: [ ^RealInterval inf: (self sup * anInt inf) sup: (self inf *anInt sup) ] ] ] 
		ifFalse: [ anInt negative 
			ifTrue: [ ^RealInterval inf: (self sup * anInt sup) sup: (self inf *anInt inf) ] 
			ifFalse: [ ^anInt * self ] ]   ].
