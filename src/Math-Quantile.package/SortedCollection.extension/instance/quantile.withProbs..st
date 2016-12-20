*Math-Quantile
quantile: aProbability withProbs: anArray
	| a b c d p f |
	a := anArray at: 1.
	b := anArray at: 2.
	c := anArray at: 3.
	d := anArray at: 4.
	p := (self size + b) * aProbability + a.
	p := p < 1
		ifTrue: [ 1 ]
		ifFalse: [ p min: self size ].
	^ p truncated = p
		ifTrue: [ self at: p ]
		ifFalse: [ (f := self at: p floor)
				+ (((self at: p ceiling) - f) * (p fractionPart * d + c)) ]