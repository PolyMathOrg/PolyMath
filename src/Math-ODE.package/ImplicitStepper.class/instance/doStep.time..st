as yet unclassified
doStep: aState time: t
	"This method should take one step from inState at time t of size dt, and modify the state, then answer it. The default implementation here is Backward Euler Method with prediction made by forward Euler."
	self stepSize isNil ifTrue: [self error: 'step size required by stepper'].
	aState isNumber 
		ifTrue: [^ (self stepSize * (system x: aState t: t) + aState)]
	"a collection"	
		ifFalse:
			[(1 to: aState size) 
			do: [ :i |
				| xi  ti |
					ti := t + self stepSize.
					xi := aState at: i.
					aState at: i put:  xi + (system x: xi t: ti )* self stepSize ].
				^ aState.]