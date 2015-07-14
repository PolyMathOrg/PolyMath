transformation
changeParametersBy: aVector
	"Modify the parameters of the receiver by aVector."
	alpha := alpha + ( aVector at: 1).
	beta := beta + ( aVector at: 2).
	self computeNorm.
	incompleteGammaFunction := nil.
	randomCoefficients := nil.