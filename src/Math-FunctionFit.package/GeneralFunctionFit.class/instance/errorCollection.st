accessing
errorCollection
	^ result
		ifNil: [ Error signal: 'run "self evaluate" first' ]
		ifNotNil: [ :r | self optimizer functionBlock errorCollection: r ]