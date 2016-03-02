transformation
changeParametersBy: aVector
	"Modify the parameters of the receiver by aVector."
	alpha1 := alpha1 + ( aVector at: 1).
	alpha2 := alpha2 + ( aVector at: 2).
	self computeNorm.
	gamma1 := nil.
	gamma2 := nil.
	incompleteBetaFunction := nil.