operation
evaluateIteration
		"Perform an accumulation of the data from the server.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 9/3/99 "
	dataServer reset.
	dataSetSize := 0.
	[ dataServer atEnd]
		whileFalse:[ self accumulate: dataServer next.
					 dataSetSize := dataSetSize + 1.
					].
	^self collectChangesAndResetClusters