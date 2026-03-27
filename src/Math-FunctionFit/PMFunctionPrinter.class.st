Class {
	#name : 'PMFunctionPrinter',
	#superclass : 'Object',
	#category : 'Math-FunctionFit',
	#package : 'Math-FunctionFit'
}

{ #category : 'printing' }
PMFunctionPrinter >> printFunction: aFunction [

	^ aFunction compiledBlock sourceNode sourceCode
]
