operation
initializeIterations
	"(c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 9/3/99 "

	dataServer open.
	result 
		do: [:each | each isUndefined ifTrue: [each centerOn: dataServer next]]