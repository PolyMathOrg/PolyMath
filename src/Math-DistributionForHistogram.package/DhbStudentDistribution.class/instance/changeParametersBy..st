transformation
changeParametersBy: aVector
	"Modify the parameters of the receiver by aVector."
	degreeOfFreedom := degreeOfFreedom + ( aVector at: 1).
	self computeNorm.