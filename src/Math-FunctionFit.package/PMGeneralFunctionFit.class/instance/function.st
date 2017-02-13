accessing
function
"does usually not return the originally entered block, but a SimpleParameterFunction with the parameters set to the result"
|f|
f :=errorFunction function .
^result ifNil: [f] ifNotNil: [PMSimpleParameterFunction function: f parameters: result]