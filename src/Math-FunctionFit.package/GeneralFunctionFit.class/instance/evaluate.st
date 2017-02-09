operation
evaluate 
|ff|
ff :=ErrorMinimizer function: errorFunction.
firstResult :=[ff evaluate .ff parameters] 
	ifError: [:err :rcvr | verbose ifTrue: [self inform: 'ErrorMinimizer was not successful']. nil].
firstResult ifNotNil: [go addPointAt: firstResult] .
firstResult := go evaluate .
self errorType =#squared 
	ifTrue: [ff :=FunctionFit function: errorFunction function data: errorFunction data ].
ff parameters: firstResult.
ff desiredPrecision: PMFloatingPointMachine new machinePrecision.
ff maximumIterations: 1000 .
result:=[ff evaluate .ff parameters] 
			ifError: [:err :rcvr | 
				verbose ifTrue: [self inform: 'last FunctionFit was not successful']. 
				ff result parameters].
((errorFunction value: result) > (errorFunction value: firstResult)) ifTrue:[
	ff:=result.
	result :=firstResult.
	firstResult :=ff.
	verbose ifTrue: [self inform: 'first result was better than final result'  ] ].
^result  