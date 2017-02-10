accessing
resultsKeyFor: aName AtPosition: anInteger
	"utility to construct the key to look for in docu. see testResultsKeyAtPosition."

	| aResults repetitions key result |
	aResults := self resultsAt: aName.
	key := aResults at: anInteger.
	key isArray
		ifFalse: [ ^ aResults ].
	repetitions := 0.
	aResults
		from: 1
		to: anInteger - 1
		do: [ :i | 
			i = key
				ifTrue: [ repetitions := repetitions + 1 ] ].
	result := (Array new: key size + repetitions)
		replaceFrom: 1 
		to: key size
		with: key
		startingAt: 1.
	key size + 1 to: result size do: [ :i | result at: i put: $+ ].
	^ result