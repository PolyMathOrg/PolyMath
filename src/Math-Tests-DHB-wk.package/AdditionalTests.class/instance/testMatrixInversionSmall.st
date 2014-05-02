tests
testMatrixInversionSmall
"it is here since it uses random matrices"
	| m c i|
	c :=DhbSymmetricMatrix identity: 5.
	3 timesRepeat:  [ [m:=DhbSymmetricMatrix new: 5 random:20 . m determinant =0] whileTrue.  "singular matrix not allowed"
	self should:  [ ((i:=m crlInverse)   *m) =c].  
	self should: [i class =DhbSymmetricMatrix ].  
 	self should:  [ ((i:=m inversePureLUP)  *m) =c].  
	self should: [i class =DhbSymmetricMatrix ].  
	self should:  [ (m * (i:=m inversePureCRL)) =c].  
	self should: [i class =DhbSymmetricMatrix ].   ].
	3 timesRepeat:  [ [m:=DhbMatrix rows:  5 columns: 5 random:20 . m determinant =0] whileTrue.  
 	self should:  [ (m * (i:=m inverse)) =c].  
	self should: [i class =DhbMatrix ].  
	self should:  [ ((i:=m inversePureCRL)  *m) =c]. 
	self should: [i class =DhbMatrix ].    ].