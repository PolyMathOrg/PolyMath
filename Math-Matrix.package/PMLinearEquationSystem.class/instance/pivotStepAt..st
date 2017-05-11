transformation
pivotStepAt: anInteger
	"Private - Performs an optimum pivot operation at anInteger."
	self swapRow: anInteger withRow: (self largestPivotFrom: anInteger);
		   pivotAt: anInteger.