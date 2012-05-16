information
solutionAt: anInteger
		"Answer the solution corresponding to the anInteger-th constant array.
		 (c) Copyrights Didier BESSET, 1999, all rights reserved.
		 Initial code: 12/2/99 "
	"solutions isNil
		ifTrue: [ [self solve] when: Error do: [ :signal |solutions := 0. signal return: nil.] ].
	solutions = 0
		ifTrue: [ ^nil].
	( solutions at: anInteger) isNil
		ifTrue: [ self backSubstitutionAt: anInteger].
	^solutions at: anInteger"

	solutions isNil
		ifTrue: [ [self solve] on: Error do: [ :signal |solutions := 0. signal return: nil.] ].
	solutions = 0
		ifTrue: [ ^nil].
	( solutions at: anInteger) isNil
		ifTrue: [ self backSubstitutionAt: anInteger].
	^solutions at: anInteger