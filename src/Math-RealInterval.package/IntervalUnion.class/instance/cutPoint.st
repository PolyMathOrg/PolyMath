accessing
cutPoint
^self size<2 
	ifTrue:[self size =1 
  		ifTrue: [self first cutPoint]
  		ifFalse:[Float nan]]
	ifFalse: [ (self inf<0 and:[self sup>0])
		ifTrue: [ 0.0 ] 
		ifFalse: [ self privateCutPoint ] ]