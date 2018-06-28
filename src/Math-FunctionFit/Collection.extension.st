Extension { #name : #Collection }

{ #category : #'*Math-FunctionFit' }
Collection >> norm [
^(self*self)sum sqrt
]
