*Math-DHB-wk
new: dim random: aMaxNumber
	"Answer a new symmetric matrix of the given dimensions filled with random numbers"
	|a aRow|
	a:=self new:dim .
	1 to: dim do:[:i|a rowAt: 1 columnAt: i put: (aMaxNumber random)].
	2 to: dim do: [:rowPos|
		aRow :=DhbVector new: dim .
		1 to: rowPos -1 do:[:pos| aRow at: pos put: (a rowAt: pos columnAt: rowPos)  ] .
		rowPos to: dim do:[:pos| aRow at: pos put: (aMaxNumber random) ]. 
		(a rows) at: rowPos put: aRow ]  .    
	^a 