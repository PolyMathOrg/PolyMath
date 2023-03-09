Extension { #name : #Integer }

{ #category : #'*Math-Numerical' }
Integer >> gamma [
	self > 0
		ifFalse: [^ self error: 'Attempt to compute the Gamma function of a non-positive integer'].
	^ (self - 1) factorial
]

{ #category : #'*Math-Numerical' }
Integer >> inverseBinomialCoefficient [

	" Reverse binomial coefficient. Answer a <Collection> with all n and k such that n take: k = self. Elements in the answered Collection should be read as paired. Each pair represents (n,k) in the binomial coefficient formula.
	See https://math.stackexchange.com/a/103385/205 for details. "

	| k |
	[ self > 1 ] assert.
	k := 0.
	^ Array streamContents: [ :stream |
		  [ true ] whileTrue: [
			  | nmin nmax choose |
			  k := k + 1.
			  2 * k + 1 * self <= (4 ** k) ifTrue: [ ^ stream contents ].
			  nmin := ((k factorial * self) nthRoot: k) ceiling.
			  nmax := nmin + k + 1.
			  nmin := nmin max: 2 * k.
			  choose := nmin asInteger numberOfCombinationsTaken: k.
			  nmin to: nmax do: [ :n |
				  choose = self ifTrue: [
					  stream nextPutAll: {
							  n asInteger.
							  k asInteger }.
					  k < (n - k) ifTrue: [
						  stream nextPutAll: {
								  n asInteger.
								  (n - k) asInteger } ] ].
				  choose := choose * (n + 1).
				  choose := (choose / (n + 1 - k)) ceiling ] ] ]
]
