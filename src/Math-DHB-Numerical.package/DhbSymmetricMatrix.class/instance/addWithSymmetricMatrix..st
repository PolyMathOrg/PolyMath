operation
addWithSymmetricMatrix: aMatrix
		"optimized"
		|aRowSize aResult aRow row1 row2|
	aRowSize :=self numberOfRows .
	aResult :=DhbSymmetricMatrix new: aRowSize .  
	aResult rows at: 1 put:  (self rowAt: 1) + (aMatrix rowAt: 1).
	2 to: aRowSize do: [:rowPos|
		row1 :=self rowAt: rowPos .
		row2 :=aMatrix rowAt: rowPos .
		aRow :=DhbVector new: aRowSize .
		1 to: rowPos -1 do:[:pos| aRow at: pos put: (aResult rowAt: pos columnAt: rowPos)  ] .
		rowPos to: aRowSize do:[:pos| aRow at: pos put: ((row1 at: pos)+ (row2 at: pos)) ]. 
		(aResult rows) at: rowPos put: aRow ]  .    
	^aResult 