creation
function: anErrorOfParameterFunction 
|f d|
f := PMErrorAsParameterFunction function: anErrorOfParameterFunction.
d :=( 1 to:( f maxFunction ))collect: [:i| i@0]. 
^self new initialize: d data: f