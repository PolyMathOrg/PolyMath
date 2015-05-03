instance creation
new: dim function: aBlock
"Answer a new symmetric matrix with dimensions dim filled with 
aBlock value: RowposRespectivelyColpos value: ColposRespectivelyRowpos"
	|a aRow|
	a:=self new basicInitialize: dim.
	aRow := DhbVector new: dim.
	1 to: dim do:[:i|aRow at: i put: (aBlock value: i value:1)].
	a rows at: 1 put: aRow.
	2 to: dim do: [:rowPos|
		aRow :=DhbVector new: dim .
		1 to: rowPos -1 do:[:pos| aRow at: pos put: ((a rows at: pos) at: rowPos)].
		rowPos to: dim do:[:pos| aRow at: pos put: (aBlock value: rowPos value:pos)]. 
		(a rows) at: rowPos put: aRow ].    
	^a 