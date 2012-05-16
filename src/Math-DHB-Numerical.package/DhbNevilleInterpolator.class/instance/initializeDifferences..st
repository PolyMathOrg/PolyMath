information
initializeDifferences: aNumber
		"Private -
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 28/5/99 "
	| size nearestIndex dist minDist |
	size := pointCollection size.
	leftErrors size = size
		ifFalse:[ leftErrors := Array new: size.
				  rightErrors := Array new: size.
				].
	minDist := ( ( self xPointAt: 1) - aNumber) abs.
	nearestIndex := 1.
	leftErrors at: 1 put: ( self yPointAt: 1).
	rightErrors at: 1 put: leftErrors first.
	2 to: size do:
		[ :n |
		  dist := ( ( self xPointAt: n) - aNumber) abs.
		  dist < minDist
			ifTrue: [ dist = 0
						ifTrue: [ ^n negated].
					  nearestIndex := n.
					  minDist := dist.
					].
		 leftErrors at: n put: ( self yPointAt: n).
		 rightErrors at: n put: ( leftErrors at: n).
		].
	^nearestIndex