as yet unclassified
run
	| instance checkSelectors |
	instance := self new.
	checkSelectors := self selectors select: [ :each | each beginsWith: 'check' ].
	^ (checkSelectors collect: [ :selector |
		(selector copyFrom: 6 to: selector size) ->
		((instance perform: selector) - instance standard) abs ]) asDictionary