initialization
initializeIterations

	dataServer open.
	result 
		do: [:each | each isUndefined ifTrue: [ each centerOn: dataServer next ]]