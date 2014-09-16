accessing
errorCollection
^result ifNil: [Error signal:  'run "self evaluate" first'] 
	ifNotNilDo: [:r| self optimizer functionBlock errorCollection: r].