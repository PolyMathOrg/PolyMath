accessing
ruleOfThumbBandWidth
	"Silverman's Rule of Thumb, assumes that the distribution is similar to a normal distribution"
	|s|
	s:=data stdev min: (data interQuartileRange / 1.34).
	^bandwidth := 0.9 * s * (data size raisedTo: (-0.2))