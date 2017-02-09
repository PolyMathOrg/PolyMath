transformation
changeParametersBy: aVector
	"Modify the parameters of the receiver by aVector."

	super changeParametersBy: (Array with: aVector first / 2 with: 0)