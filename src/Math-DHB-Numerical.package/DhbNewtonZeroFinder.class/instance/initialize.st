as yet unclassified
initialize
	"Initialize lineSearchFunction and lineSearch: it depends on other variables only indirectly,
	can be initialized once at the begining"
	super initialize.
	lineSearchFunctionBlock := [ :t |
		newFunctionValue := functionBlock value: t * searchStep + result.
		0.5 * newFunctionValue squared ].
	lineSearch := DhbLineSearch new.
	lineSearch setFunction:  lineSearchFunctionBlock.
	^ self