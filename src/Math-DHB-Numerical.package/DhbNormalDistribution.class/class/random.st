information
random
		"Answer a random number distributed according to a (0,1) normal distribution.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 15/2/99 "
	| v1 v2 w y |
	NextRandom isNil
		ifTrue: [ [ v1 := Number random * 2 - 1.
					v2 := Number random * 2 - 1.
					w := v1 squared + v2 squared.
					w > 1 ] whileTrue: [].
				  y := ( ( w ln * 2 negated) / w) sqrt.
				v1 := y * v1.
				NextRandom := y * v2.
				]
		ifFalse:[ v1 :=NextRandom.
				  NextRandom := nil.
				].
	^v1