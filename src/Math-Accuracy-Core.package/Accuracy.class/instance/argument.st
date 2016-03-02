accessing
argument
	| r |
	r := self argumentAt: self findKey.
	numberOfResults ifNotNil: [ :rn | r := r at: rn ].
	^ r