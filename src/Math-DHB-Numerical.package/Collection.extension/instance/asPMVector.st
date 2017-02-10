*Math-DHB-Numerical
asPMVector
	
	| aVector index |
	aVector := PMVector new: self size.
	index := 0.
	self do: [:each | aVector at: (index := index + 1) put: each].
	^aVector