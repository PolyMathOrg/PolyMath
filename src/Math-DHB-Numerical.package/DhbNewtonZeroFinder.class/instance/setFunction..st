initialization
setFunction: aBlock
	"Sets the function block (delegates to superclass). Resets the derivative"
	super setFunction: aBlock.
	derivativeBlock := nil.