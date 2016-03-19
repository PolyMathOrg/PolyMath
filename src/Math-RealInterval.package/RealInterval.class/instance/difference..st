set operations
difference: anInt 
"at the moment not dependent on onlyfloats as this would introduce bugs. should be done very carefully, if at all"
self=anInt ifTrue:[^RealInterval new].
(anInt isNumber or: [self isEmpty or: [anInt isEmpty]] ) ifTrue: [^self] .
anInt isIntervalUnion ifTrue:[^(IntervalUnion with:self) difference: anInt ].
^anInt inf >sup 
	ifTrue:[self]
	ifFalse:[(anInt inf <=inf)
		ifTrue: [ anInt sup<sup 
			ifTrue: [RealInterval inf: (inf max: anInt sup) sup:sup ] 
			ifFalse: [ RealInterval new ] ]
		ifFalse:[ anInt sup < sup 
			ifTrue: [ (RealInterval inf: inf sup: anInt inf)union: (RealInterval inf: anInt sup sup:sup) ] 
			ifFalse:[ RealInterval inf: inf sup: anInt inf ] ] ].
