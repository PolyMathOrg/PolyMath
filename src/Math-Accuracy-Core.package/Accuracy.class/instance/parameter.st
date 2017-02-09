accessing
parameter
	| r |
	r := self parameterAt: self findKey.
	numberOfParameters ifNotNil: [ :rn | r := r at: rn ].
	^ r