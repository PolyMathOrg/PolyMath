as yet unclassified
equalsTo: aMatrix
	self rows 
			with: aMatrix rows  
			do: [:a :b| (a equalsTo: b) ifFalse: [ ^false ] ].
	^ true 