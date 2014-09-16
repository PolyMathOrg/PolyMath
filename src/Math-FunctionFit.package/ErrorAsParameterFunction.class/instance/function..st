initialization
function: anErrorOfParameterFunction
|d f size steps|
d :=anErrorOfParameterFunction data.
usedVars :=anErrorOfParameterFunction parameterSize .
self initializeVarArray: 1.
size:=d size sqrt ceiling .
steps:=d size // (usedVars +1).
size :=size +steps //2.
size := size min: steps.
steps :=d size //size -1.
steps <usedVars ifTrue:[self error: 'dataSize too small for the parameterSize'].
function := (0 to: steps)collect: [:i| 
	f:=anErrorOfParameterFunction copy.
	f data: (d copyFrom:( i *size+1) to:( i=steps ifTrue: [d size] ifFalse: [(i+1) *size])).
	f]