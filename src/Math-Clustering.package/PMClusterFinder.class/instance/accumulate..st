transformation
accumulate: aVector
	"Private - Accumulate aVector into the nearest cluster"
	
	(result at: (self indexOfNearestCluster: aVector)) accumulate: aVector