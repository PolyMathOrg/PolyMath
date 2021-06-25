Extension { #name : #Integer }

{ #category : #'*Math-Numerical' }
Integer >> findNK [
	" Reverse binomial coefficient. Answer a <Collection> with all n and k such that n take: k = self. Elements in the answered Collection should be read as paired. Each pair represents (n,k) in the binomial coefficient formula. 
	See https://math.stackexchange.com/a/103385/205 for details. "

	| k |
	[ self > 1 ] assert.
    k := 0.
	^ Array streamContents: [ : stream | 
	    [ true ] whileTrue: [ 
			| nmin nmax choose |
			k := k + 1.
			((2 * k + 1) * self) <= (4 ** k)
				ifTrue: [ ^ stream contents ].
			nmin := k firstOver: (k factorial * self).
			nmax := nmin + k + 1.
			nmin := nmin max: (2 * k).
	      choose := nmin asInteger take: k.
			nmin to: nmax do: [ : n |
				choose = self
					ifTrue: [  
						stream nextPutAll: { n asInteger . k asInteger }.
						k < (n - k)
							ifTrue: [ stream nextPutAll: { n asInteger . (n - k) asInteger } ] ].
	            choose := choose * (n + 1).
	            choose := (choose / (n + 1 - k)) ceiling ] ] ]

]

{ #category : #'*Math-Numerical' }
Integer >> firstOver: c [
    " Binary search to find smallest value of n for which n ** self >= c "
	| n lo hi mid |

    n := 1.
    [ (n ** self) < c ] whileTrue: [ n := n * 2 ].
    lo := 1.
    hi := n.
    [ (hi - lo) > 1 ] whileTrue: [ 
		mid := lo + ((hi - lo) / 2) ceiling.
		(mid ** self) < c
			ifTrue: [ lo := mid ]
			ifFalse: [ hi := mid ] ].
	[ (hi ** self) >= c ] assert.
	[ ((hi - 1) ** self) < c ] assert.
   ^ hi

]

{ #category : #'*Math-Numerical' }
Integer >> gamma [
	self > 0
		ifFalse: [^ self error: 'Attempt to compute the Gamma function of a non-positive integer'].
	^ (self - 1) factorial.
]

{ #category : #'*Math-Numerical' }
Integer >> random [
		"Answer a random integer between 0 and the receiver."
	^ PMMitchellMooreGenerator new integerValue: self
]
