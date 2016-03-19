accessing
inf: aNumber
"if aNumber > sup then an empty RealInterval will be returned"
^ inf:= sup 
	ifNil: [ sup:=aNumber ] 
	ifNotNil: [sup isNaN 
		ifTrue: [ aNumber isInfinite 
			ifTrue: [ (aNumber <0) 
				ifTrue: [sup:= Float infinity. 0-Float infinity] 
				ifFalse: [sup:= Float nan]] 
			ifFalse: [sup:=aNumber] ] 
		ifFalse:[ ((aNumber <=sup)and:[aNumber < Float infinity ]) ifTrue: [ aNumber ] ifFalse:[sup:= Float nan]]] .