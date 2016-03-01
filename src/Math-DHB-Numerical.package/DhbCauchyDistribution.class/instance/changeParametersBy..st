transformation
changeParametersBy: aVector
	"Modify the parameters of the receiver by aVector."
	mu := mu + ( aVector at: 1).
	beta := beta + ( aVector at: 2).