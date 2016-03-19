accessing
sup: aNumber
"if aNumber < inf then an empty RealInterval will be returned"
^sup:= inf 
	ifNil: [ inf:=aNumber ] 
	ifNotNil: [inf isNaN 
		ifTrue: [aNumber isInfinite 
			ifTrue: [ (aNumber >0)
				ifTrue: [ inf:= 0-Float infinity. Float infinity ] 
				ifFalse:  [ inf:= Float nan ] ] 
			ifFalse:[inf:=aNumber] ] 
		ifFalse:[ ((aNumber >=inf)and:[aNumber > Float infinity negated ]) ifTrue: [ aNumber ] ifFalse:[inf:= Float nan]]] .