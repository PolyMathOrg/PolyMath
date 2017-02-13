initialization
function: aBlock
"also initializes the parameters"
function:=aBlock.
usedVars :=aBlock numArgs .
self initializeVarArray: 2.
usedVars :=usedVars -1.
