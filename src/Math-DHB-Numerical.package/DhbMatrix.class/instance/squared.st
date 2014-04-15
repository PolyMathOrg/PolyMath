operation
squared
	|transposed aRowSize aRow aResult|
	transposed :=self privateTranspose .
	aRowSize :=transposed numberOfRows .
	aResult :=DhbSymmetricMatrix new: aRowSize .  
	aResult rows at: 1 put:  transposed * (transposed rowAt: 1).
	2 to: aRowSize do: [:rowPos|
		aRow :=DhbVector new: aRowSize .
		1 to: rowPos -1 do:[:pos| aRow at: pos put: (aResult rowAt: pos columnAt: rowPos)  ] .
		rowPos to: aRowSize do:[:pos| aRow at: pos put: ((transposed rowAt: rowPos) * (transposed rowAt: pos)) ]. 
		(aResult rows) at: rowPos put: aRow ]  .    
	^aResult 