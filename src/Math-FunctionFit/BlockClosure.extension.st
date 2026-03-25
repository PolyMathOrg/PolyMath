Extension { #name : 'BlockClosure' }

{ #category : '*Math-FunctionFit' }
BlockClosure >> functionString [

	^ self sourceNode value sourceCode asString
]
