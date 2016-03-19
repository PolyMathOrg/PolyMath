accessing
cutPoint
|i|
^self isEmpty 
	ifTrue: [ Float nan ] 
	ifFalse: [ self isMixed 
		ifTrue: [ 0.0 ] 
		ifFalse: [ self isNumber 
			ifTrue: [ Float nan ] 
			ifFalse: [ (inf closeTo: 0) 
				ifTrue:[(sup=Float infinity)
					ifTrue: [ 1.0 ] 
					ifFalse: [ sup +inf /2.0 ] ]
				ifFalse:[(sup closeTo: 0) 
					ifTrue: [ (inf=Float infinity negated ) 
						ifTrue: [ -1.0 ] 
						ifFalse: [ sup +inf /2.0 ] ] 
					ifFalse:[ self isFinite 
						ifTrue: [ i:=inf sign * (inf * sup)sqrt. ((i=sup) or: [i=inf])ifTrue: [ i:=inf+sup/2 ] ifFalse:[i] ] 
						ifFalse: [ (self sup=Float infinity) 
							ifTrue: [ inf * 10.0 ] 
							ifFalse: [ sup *10.0 ] ] ] ] ] ] ]