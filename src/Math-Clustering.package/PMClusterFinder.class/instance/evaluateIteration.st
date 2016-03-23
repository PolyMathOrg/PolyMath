operation
evaluateIteration
	"Perform an accumulation of the data from the server."
	
	dataServer reset.
	dataSetSize := 0.
	[ dataServer atEnd ]
		whileFalse: [ self accumulate: dataServer next.
					 dataSetSize := dataSetSize + 1 ].
	^ self collectChangesAndResetClusters