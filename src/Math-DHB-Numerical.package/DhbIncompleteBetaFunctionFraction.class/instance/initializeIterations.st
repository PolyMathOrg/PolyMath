operation
initializeIterations
	"Initialize the iterations (subclasses must write their own method and call this one last)."

	numerator := 1.
	denominator := 1 / (self limitedSmallValue: 1 - (q1 * x / q2)).
	result := denominator