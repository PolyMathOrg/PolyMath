accessing
function: aBlock
	"sets the function to be fitted. the first value has to be the independent variable, further values are the parameters to be fitted. only one independent variable is allowed (if you have several independent vars or eg a function of a vector, that returns another vector, have a look at the 'spiral' example)."
self resetResult.
errorFunction function: aBlock .