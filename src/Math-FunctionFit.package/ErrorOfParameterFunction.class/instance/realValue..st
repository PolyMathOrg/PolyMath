evaluating
realValue: parameters
"returns the sqrt of the mean of the sum of squared errors, or the mean abs error, or the quartile error, or the insensitive error"
|e|
e:=self value: parameters .
(#(#insensitive #quartile) includes: errorType) ifFalse: [e :=e / data size] .
errorType = #squared ifTrue: [e := e sqrt]  . "if relativeError=true this is not really correct at the moment because of the way value: is calculated, but value: cant be changed! if anything, the calc here could be changed."
^e
